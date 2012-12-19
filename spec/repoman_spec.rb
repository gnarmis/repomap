$: << "#{File.dirname(__FILE__)}/../lib"

require 'repomap'
require 'fileutils'

include FileUtils

module RepoMap
  ENV['REPO_MAP'] = "#{File.dirname(__FILE__)}/../tmp/repomap.yml"
  REPO1 = "#{File.dirname(__FILE__)}/../tmp/repo1"
end

include RepoMap

describe "RepoMap SubCommands" do

  before :each do
    mkdir_p "#{REPO1}/.git"
    # so it's not empty...
    touch "#{REPO1}/README"
  end

  after :each do
    rm_rf "#{REPO1}/.git"
  end

  after :all do
    rm_rf "#{File.dirname(__FILE__)}/../tmp"
  end

  describe "#add!" do

    it "should add a given path to ENV['REPO_MAP']" do
      RepoMap.handle :add => REPO1, :recursive => false 
      hash = YAML::load(File.read(repo_map))
      hash[File.expand_path(REPO1).to_sym][:name].should == File.basename(REPO1)
    end

  end

  describe "#remove!" do
  
    it "should remove a given path from ENV['REPO_MAP']" do
      RepoMap.handle :add => REPO1, :recursive => false
      hash1 = YAML::load(File.read(repo_map))
      repo1_in_repomap = hash1[File.expand_path(REPO1).to_sym][:name] \
                          == File.basename(REPO1)
      RepoMap.handle :remove => REPO1
      hash2 = YAML::load(File.read(repo_map))
      repo1_removed = !(hash2.has_key?(File.expand_path(REPO1).to_sym))
      (repo1_in_repomap and repo1_removed).should == true
    end
  
  end

end

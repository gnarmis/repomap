$: << "#{File.dirname(__FILE__)}/../lib"

require 'repomap'
require 'fileutils'

include FileUtils

module RepoMap
  TEST_REPO_MAP = "#{File.dirname(__FILE__)}/../tmp/repomap.yml"
  def repo_map; TEST_REPO_MAP; end
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

    it "should add a given path to RepoMap file" do
      opts = repo_opts(:add, REPO1)
      RepoMap.handle(opts) 
      hash = YAML::load(File.read(repo_map))
      hash[File.expand_path(REPO1).to_sym][:name].should == File.basename(REPO1)
    end

  end

  describe "#remove!" do
  
    it "should remove a given path from RepoMap file" do
      opts = repo_opts(:add, REPO1)
      RepoMap.handle opts
      hash1 = YAML::load(File.read(repo_map))
      repo1_in_repomap = hash1[File.expand_path(REPO1).to_sym][:name] \
                          == File.basename(REPO1)
      opts = repo_opts(:remove, REPO1)
      RepoMap.handle opts
      hash2 = YAML::load(File.read(repo_map))
      repo1_removed = !(hash2.has_key?(File.expand_path(REPO1).to_sym))
      (repo1_in_repomap && repo1_removed).should == true
    end
  
  end

end

def repo_opts(action, repo_path)
  opts = {}
  opts[:action]  = action
  opts[:options] = {:path      => repo_path,
                    :recursive => false}
  return opts
end

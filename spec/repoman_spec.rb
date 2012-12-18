$: << "#{File.dirname(__FILE__)}/../lib"

require 'repoman'
require 'fileutils'

include FileUtils

module RepoMan
  ENV['REPO_STORE'] = "#{File.dirname(__FILE__)}/../tmp/repo-store.yml"
  REPO1 = "#{File.dirname(__FILE__)}/../tmp/repo1"
end

include RepoMan

describe "RepoMan SubCommands" do

  before :each do
    mkdir_p "#{REPO1}/.git"
    # so it's not empty...
    touch "#{REPO1}/README"
  end

  after :each do
    rm_f "#{REPO1}/.git"
  end

  after :all do
    `rm -rf  "#{File.dirname(__FILE__)}/../tmp"`
  end

  describe "#add!" do

    it "should add a given path to ENV['REPO_STORE']" do
      RepoMan.handle :add => REPO1, :recursive => false 
      hash = YAML::load(File.read(repo_store))
      hash[File.expand_path(REPO1).to_sym][:name].should == File.basename(REPO1)
    end

  end

end

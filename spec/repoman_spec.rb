$: << "#{File.dirname(__FILE__)}/../lib"

require 'repomap'
require 'fileutils'

include FileUtils

module RepoMap
  TEST_REPO_MAP = "#{File.dirname(__FILE__)}/../tmp/repomap.yml"
  def repo_map; TEST_REPO_MAP; end
  MANY_REPOS = "#{File.dirname(__FILE__)}/../tmp/many_repos"
  REPO1 = "#{File.dirname(__FILE__)}/../tmp/repo1"
end

include RepoMap

describe "RepoMap SubCommands" do

  before :each do
    mkdir_p "#{REPO1}/.git"
    touch "#{REPO1}/README"
    mkdir_p "#{MANY_REPOS}/repo2a/.git"
    touch "#{MANY_REPOS}/repo2a/README"
    mkdir_p "#{MANY_REPOS}/repo2b/.git"
    touch "#{MANY_REPOS}/repo2b/README"
  end

  after :each do
    rm_rf "#{REPO1}/.git"
    rm_rf "#{MANY_REPOS}"
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

  describe "#add_recursive!" do
    
    it "should recursively add all git repo's in a certain path" do
      opts = repo_opts(:add, MANY_REPOS, true)
      RepoMap.handle(opts)
      hash = YAML::load(File.read(repo_map))
      repo2a_path = File.expand_path("#{MANY_REPOS}/repo2a")
      repo2b_path = File.expand_path("#{MANY_REPOS}/repo2b")
      hash[repo2a_path.to_sym][:name].should == File.basename(repo2a_path)
      hash[repo2b_path.to_sym][:name].should == File.basename(repo2b_path)
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

def repo_opts(action, repo_path, recursive=false)
  opts = {}
  opts[:action]  = action
  opts[:options] = {:path      => repo_path,
                    :recursive => recursive}
  return opts
end

require 'yaml'
require 'pp'

module RepoMan
  GIT_REPOS = "#{File.dirname(__FILE__)}/git-repos.yml"

  def self.handle options
    add! options[:add] if options[:add] != ''
    list if options[:list]
  end

  def add! path
    if File.directory? path and has_git? path
      full_path = File.expand_path(path)
      basename = File.basename(full_path)
      puts "repo: I'm adding '#{basename}' to '#{GIT_REPOS}'"
      add_repo! basename, full_path
      exit 0
    else
      STDERR.puts "repo: Not a git repository -- #{path}"
      exit 1
    end
  end

  def list
    git_repos_validate
    hash = YAML::load(File.read(GIT_REPOS))
    longest_name = 0
    hash.each do |k,v|
     longest_name = v[:name].length if v[:name].length > longest_name 
    end
    hash.each do |key, value|
     printf "%-#{longest_name}s %s\n", value[:name], key
    end
    exit 0
  end

  def add_repo! reponame, full_path
    git_repos_validate
    hash = YAML::load(File.read(GIT_REPOS))
    hash = {} if hash==nil
    hash[full_path.to_sym] = {:name => reponame}
    File.open(GIT_REPOS, "w") do |f|
      f.write hash.to_yaml
    end
  end

  def git_repos_validate
    unless git_repos_exist?
      File.new(GIT_REPOS, "w")
      File.open(GIT_REPOS, "w") do |f|
        f.write "---\n"
      end
    end
  end

  def has_git? path
    File.directory? "#{path}/.git"
  end

  def git_repos_exist?
    a = File.exist? GIT_REPOS
    b = File.read(GIT_REPOS)!='' if a
    a and b
  end

end

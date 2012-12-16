require 'yaml'

module RepoMan
  GIT_REPOS = "#{File.dirname(__FILE__)}/git-repos.yml"

  def self.handle options
    if options.has_key? :add
      add options[:add]
    end
  end

  def add path
    if File.directory? path and has_git? path
      full_path = File.expand_path(path)
      basename = File.basename(full_path)
      puts "repo: I'm adding '#{basename}' to '#{GIT_REPOS}'"
      add_repo basename, full_path
      exit 0
    else
      STDERR.puts "repo: Not a git repository -- #{path}"
      exit 1
    end
  end

  def has_git? path
    File.directory? "#{path}/.git"
  end

  def add_repo reponame, full_path
    unless git_repos_exist?
      File.new(GIT_REPOS, "w")
      File.open(GIT_REPOS, "w") do |f|
        f.write "---\n"
      end
    end
    hash = YAML::load(File.read(GIT_REPOS))
    hash = {} if hash==nil
    hash[reponame.to_sym] = full_path
    File.open(GIT_REPOS, "w") do |f|
      f.write hash.to_yaml
    end
  end

  def git_repos_exist?
    a = File.exist? GIT_REPOS
    b = File.read(GIT_REPOS)!='' 
    a and b
  end
end

module RepoMan
  def self.handle options
    if options.has_key? :add
      add options[:add]
    end
  end

  def add path
    if File.directory? path and has_git? path
      puts "repo: I found a git repo at #{path}"
    else
      STDERR.puts "repo: Not a git repository -- #{path}"
      exit 1
    end
  end

  def has_git? path
    File.directory? "#{path}/.git"
  end
end

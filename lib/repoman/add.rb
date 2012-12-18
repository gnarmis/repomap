module RepoMan
  
  def add! path
    if File.directory? path and has_git? path
      full_path = File.expand_path(path)
      basename = File.basename(full_path)
      puts "repo: I'm adding '#{basename}' to '#{repo_store}'"
      add_repo! basename, full_path
    else
      STDERR.puts "repo: Not a git repository -- #{path}"
      exit 1
    end
  end

  def add_recursive! path
    if File.directory?(path) and has_git?(path)
      add! path
    elsif File.directory?(path) and !has_git?(path)
      Dir.foreach(path) do |item|
        next if item == '.' or item == '..'
        item_path = File.join(File.expand_path(path), item)
        add_recursive! item_path if File.directory? item_path
      end
    else
      STDERR.puts "repo: Not a directory or repository -- #{path}"
      exit 1
    end
  end

  def add_repo! reponame, full_path
    repo_store_validate
    hash = YAML::load(File.read(repo_store))
    hash = {} if hash==nil
    hash[full_path.to_sym] = {:name => reponame}
    File.open(repo_store, "w") do |f|
      f.write hash.to_yaml
    end
  end

end

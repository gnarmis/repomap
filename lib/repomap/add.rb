require 'find'

module RepoMap
  
  def add!(path)
    if File.directory?(path) && has_git?(path)
      full_path = File.expand_path(path)
      basename = File.basename(full_path)
      puts "repo: I'm adding '#{basename}' to '#{repo_map}'"
      add_repo! basename, full_path
    else
      STDERR.puts "repo: Not a git repository -- #{path}"
      exit 1
    end
  end


  def add_recursive!(path)
    Find.find(path) do |f|
      add! f if File.directory?(f) && has_git?(f)
    end
  end

  def add_repo!(reponame, full_path)
    repo_map_validate
    hash = YAML::load(File.read(repo_map))
    hash = {} if hash==nil
    hash[full_path.to_sym] = {:name => reponame}
    File.open(repo_map, "w") do |f|
      f.write hash.to_yaml
    end
  end

end

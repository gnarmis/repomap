module RepoMan

  def remove! path
    repo_store_validate
    full_path = File.expand_path(path)
    basename = File.basename(full_path)
    hash = YAML::load(File.read(repo_store))
    if hash.has_key?(full_path.to_sym) 
      puts "repo: I'm removing '#{basename}' from '#{repo_store}'"
    else
      STDERR.puts "repo: I don't have this repository -- '#{full_path}'"
      exit 1
    end
    hash.delete(full_path.to_sym)
    File.open(repo_store, "w") do |f|
      f.write hash.to_yaml
    end
    exit 0
  end

end

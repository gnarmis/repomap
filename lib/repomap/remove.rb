module RepoMap

  def remove!(path)
    repo_map_validate
    full_path = File.expand_path(path)
    basename = File.basename(full_path)
    hash = YAML::load(File.read(repo_map))
    if hash.has_key?(full_path.to_sym) 
      STDOUT.puts "repo: I'm removing '#{basename}' from '#{repo_map}'"
    else
      STDERR.puts "repo: I don't have this repository -- '#{full_path}'"
      exit 1
    end
    hash.delete(full_path.to_sym)
    File.open(repo_map, "w") do |f|
      f.write hash.to_yaml
    end
  end

end

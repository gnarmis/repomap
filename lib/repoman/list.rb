module RepoMan

  def list
    repo_store_validate
    hash = YAML::load(File.read(repo_store))
    longest_name = 0
    hash.each do |k,v|
     longest_name = v[:name].length if v[:name].length > longest_name 
    end
    hash.each do |key, value|
     printf "%-#{longest_name}s %s\n", value[:name], key
    end
    exit 0
  end

end

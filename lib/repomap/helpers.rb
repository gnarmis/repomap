module RepoMap

  def repo_map_validate
    unless repo_map_exists?
      File.new(repo_map, "w")
      File.open(repo_map, "w") do |f|
        f.write "---\n"
      end
    end
  end

  def has_git?(path)
    File.directory? "#{File.expand_path(path)}/.git"
  end

  def repo_map_exists?
    a = File.exist? repo_map
    b = File.read(repo_map)!='' if a
    a && b
  end

end

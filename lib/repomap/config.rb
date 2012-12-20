module RepoMap

  REPO_MAP_FILE = File.join(ENV['HOME'].strip,".repomap.yml")

  def repo_map
    REPO_MAP_FILE
  end

end

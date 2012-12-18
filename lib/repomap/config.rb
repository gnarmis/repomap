module RepoMap

  ENV['REPO_MAP'] = "#{`echo $HOME`.chomp}/.repomap.yml"

  def repo_map
    ENV['REPO_MAP']
  end

end

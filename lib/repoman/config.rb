module RepoMan

  ENV['REPO_STORE'] = "#{`echo $HOME`.chomp}/.repo-store.yml"

  def repo_store
    ENV['REPO_STORE']
  end

end

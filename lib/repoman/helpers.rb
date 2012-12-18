module RepoMan

  repo_store = ENV['repo_store']

  def repo_store_validate
    unless repo_store_exists?
      File.new(repo_store, "w")
      File.open(repo_store, "w") do |f|
        f.write "---\n"
      end
    end
  end

  def has_git? path
    File.directory? "#{File.expand_path(path)}/.git"
  end

  def repo_store_exists?
    a = File.exist? repo_store
    b = File.read(repo_store)!='' if a
    a and b
  end

end

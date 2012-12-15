module RepoMan
  def self.handle options
    if options.has_key? :add
      add options[:add]
    end
  end

  def add path
    if File.directory? path
      puts path
    end
  end
end

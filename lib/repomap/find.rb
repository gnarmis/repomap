module RepoMap

  def find path, pattern
    if path
      find_with_path path, pattern
    else
      find_without_path pattern
    end
  end

  def find_with_path path, pattern
    repo_map_validate
    hash = YAML::load(File.read(repo_map))
    regex = Regexp.new(pattern)
    fp = File.expand_path(path)
    fp_reg = Regexp.new(fp)
    hash.each do |k, v|
      fk = File.expand_path(k.to_s)
      m = fk.match(fp_reg)
      is_subdir = (fk.length>fp.length)&&(m.to_s==fp)
      if is_subdir and v[:name].to_s.match(regex)!=nil
        puts k.to_s
      end
    end
  end

  def find_without_path pattern
    repo_map_validate
    hash = YAML::load(File.read(repo_map))
    regex = Regexp.new pattern
    hash.each do |k, v|
      if v[:name].to_s.match(regex)!=nil
        puts k.to_s
      end
    end
  end

end

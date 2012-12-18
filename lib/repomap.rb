require 'yaml'
require 'repomap/config'
require 'repomap/helpers'
require 'repomap/version'
require 'repomap/add'
require 'repomap/remove'
require 'repomap/list'

module RepoMap

  # receive a hashmap like:
  #   {:add       => 'path/to/repo/or/dir',
  #    :recursive => bool}, or
  #   {:list      => bool}, or
  #   {:remove    => 'path/to/repo/in/repomap'}
  # Then, call appropriate functions.
  def self.handle options
    if options[:add] != '' and options[:add] != nil and options[:recursive]==true
      add_recursive! options[:add]
    elsif options[:add] != '' and options[:add] != nil and options[:recursive]==false
      add! options[:add]
    end
    remove! options[:remove] if options[:remove] != '' and options[:remove] != nil
    list if options[:list]
  end

end

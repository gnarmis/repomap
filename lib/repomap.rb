require 'yaml'
require 'repomap/config'
require 'repomap/helpers'
require 'repomap/version'
require 'repomap/add'
require 'repomap/remove'
require 'repomap/list'
require 'repomap/find'

module RepoMap

  # receive a hashmap like:
  #
  #   {:action   => :add,
  #    :options  => {:recursive => false}}, or
  #   {:action   => :remove,
  #    :options  => {:path => some/path }}, or
  #   {:action   => :list,
  #    :options  => nil}, or
  #   {:action   => :find,
  #    :opions   => {:path => some/path,
  #                  :pattern => "some regex"}}
  #
  # Then, call appropriate functions.
  def self.handle(options)
    
    case options[:action].to_s
    when /add/
      if path_exists? options 
         add_recursive! options[:options][:path] if options[:options][:recursive]
         add! options[:options][:path] if !(options[:options][:recursive])  
      end
    when /remove/
      if path_exists? options 
        remove! options[:options][:path]
      end
    when /list/
      list
    when /find/
      path = options[:options][:path]
      pattern = options[:options][:pattern]
      find path, pattern
    end

  end

  def path_exists?(options)

    if (options[:options][:path] != nil) &&
       (options[:options][:path] != '')
      return true
    else
      return false
    end

  end

end

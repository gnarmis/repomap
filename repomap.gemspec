$: << "#{File.dirname(__FILE__)}/lib"
require 'repomap'

Gem::Specification.new do |gem|
  gem.authors       = ["Gursimran Singh"]
  gem.email         = ["g@kilotau.com"]
  gem.description   = %q{RepoMap tracks your local git repositories.}
  gem.summary       = %q{Find and keep track of your local git repositories.}
  gem.homepage      = "http://github.com/gnarmis/RepoMap"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map {|f| File.basename(f)}
  gem.name          = "repomap"
  gem.require_paths = ["lib"] 
  gem.version       = RepoMap::VERSION
end

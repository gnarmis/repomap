$: << "#{File.dirname(__FILE__)}/lib"
require 'repoman'

Gem::Specification.new do |gem|
  gem.authors       = ["Gursimran Singh"]
  gem.email         = ["g@kilotau.com"]
  gem.description   = %q{RepoMan tracks your local git repositories.}
  gem.summary       = %q{Keep track of your local git repositories.}
  gem.homepage      = "http://github.com/gnarmis/RepoMan"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map {|f| File.basename(f)}
  gem.name          = "repo-man"
  gem.require_paths = ["lib"] 
  gem.version       = RepoMan::VERSION
end

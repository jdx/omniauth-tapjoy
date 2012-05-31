# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tapjoy_client/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jeff Dickey"]
  gem.email         = ["jeff@dickey.xxx"]
  gem.description   = %q{A client to connect to Tapjoy}
  gem.summary       = %q{}
  gem.homepage      = "http://mystique.herokuapp.com"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "tapjoy_client"
  gem.require_paths = ["lib"]
  gem.version       = TapjoyClient::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_runtime_dependency 'omniauth-oauth2'
end

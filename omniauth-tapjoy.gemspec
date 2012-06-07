# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth/tapjoy"

Gem::Specification.new do |gem|
  gem.authors       = ["Jeff Dickey"]
  gem.email         = ["jeff@dickey.xxx"]
  gem.description   = %q{An omniauth provider to connect to Tapjoy}
  gem.summary       = %q{An omniauth provider to connect to Tapjoy}
  gem.homepage      = "http://oauth.tapjoy.com"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "omniauth-tapjoy"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::Tapjoy::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_runtime_dependency 'omniauth-oauth2'
end

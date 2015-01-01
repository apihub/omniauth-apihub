# coding: utf-8
require File.expand_path('../lib/omniauth-backstage/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "omniauth-backstage"
  spec.version       = OmniAuth::Backstage::VERSION
  spec.license       = "MIT"

  spec.authors       = ["Alberto Leal"]
  spec.email         = ["albertonb@gmail.com"]
  spec.description   = %q{Backstage OAuth2 Strategy for OmniAuth.}
  spec.summary       = %q{Backstage OAuth2 Strategy for OmniAuth.}
  spec.homepage      = "https://github.com/backstage/omniauth-backstage"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rspec', '~> 2.7'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'omniauth-oauth2', '~> 1.1.2'
end
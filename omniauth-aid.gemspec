# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/aid/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-aid"
  spec.version       = Omniauth::Aid::VERSION
  spec.authors       = ["Jonas Helgemo"]
  spec.email         = ["jonas.helgemo@gmail.com"]

  spec.summary       = %q{Omniauth-strategy for using aID as an OAuth2-provider}
  spec.homepage      = "https://github.com/amedia/omniauth-aid"
  spec.licenses    = ['MIT']
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency 'omniauth-oauth2', '>= 1.3.1' # BUG https://github.com/intridea/omniauth-oauth2/issues/81
end

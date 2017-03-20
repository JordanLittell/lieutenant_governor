# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lieutenant_governor/version'

Gem::Specification.new do |spec|
  spec.name          = "lieutenant_governor"
  spec.version       = LieutenantGovernor::VERSION
  spec.authors       = ["jordanlittell"]
  spec.email         = ["jordanlittell@yahoo.com"]

  spec.summary       = "Sync routes in rails with client code"
  spec.description   = "Sync routes in rails with client code"
  spec.homepage      = "https://github.com/JordanLittell/lieutenant_governor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ["lib"]

  # spec.add_dependency "actionpack"
  spec.add_dependency "thor"
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

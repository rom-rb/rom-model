# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rom/model/version'

Gem::Specification.new do |spec|
  spec.name          = "rom-model"
  spec.version       = ROM::Model::VERSION.dup
  spec.authors       = ["Piotr Solnica"]
  spec.email         = ["piotr.solnica@gmail.com"]
  spec.summary       = 'A small collection of extensions useful for data coercion and validation'
  spec.homepage      = "http://rom-rb.org"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'dry-equalizer', '~> 0.2'
  spec.add_runtime_dependency 'dry-core', '~> 0.2', '>= 0.2.3'
  spec.add_runtime_dependency 'charlatan', '~> 0.1'
  spec.add_runtime_dependency 'virtus', '~> 1.0', '>= 1.0.5'
  spec.add_runtime_dependency 'activemodel', '>= 3.0', "< 6.0"
  spec.add_runtime_dependency 'i18n'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop", "~> 0.28.0"
end

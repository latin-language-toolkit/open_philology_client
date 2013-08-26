# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'open_philology_client/version'

Gem::Specification.new do |spec|
  spec.name          = "open_philology_client"
  spec.version       = OpenPhilologyClient::VERSION
  spec.authors       = ["Christof Sirk, Gernot Höflechner, Robert Lichtensteiner"]
  spec.email         = ["latin.language.toolkit@gmail.com"]
  spec.description   = %q{Client for the APIs of open philology projects like perseus and perseids}
  spec.summary       = %q{Client for the APIs of open philology projects like perseus and perseids}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "nestful", "~> 1.0"
  spec.add_runtime_dependency "json", "~> 1.8"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec"
end

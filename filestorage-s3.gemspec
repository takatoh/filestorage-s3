# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'filestorage-s3/version'

Gem::Specification.new do |spec|
  spec.name          = "filestorage-s3"
  spec.version       = Filestorage::VERSION
  spec.authors       = ["takatoh"]
  spec.email         = ["takatoh.m@gmail.com"]
  spec.summary       = %q{A simple file storeage of Amazon S3.}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "aws-sdk"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "filestorage", ">= 0.1.0"
end

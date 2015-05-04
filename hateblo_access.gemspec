# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hateblo_access/version'

Gem::Specification.new do |spec|
  spec.name          = "hateblo_access"
  spec.version       = HatebloAccess::VERSION
  spec.authors       = ["blue1st"]
  spec.email         = ["iwannabeabat@gmail.com"]
  spec.summary       = %q{"はてなブログのアクセス数を通知センターに通知する"}
  spec.homepage      = "http://blue1st.hateblo.jp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  
  spec.add_dependency "thor"  
end

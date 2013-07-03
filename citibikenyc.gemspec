# -*- encoding: utf-8 -*-
require File.expand_path('../lib/citibikenyc/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_development_dependency 'rake'
  gem.add_development_dependency('rspec', '~> 2.13.0')
  gem.add_development_dependency('webmock', '~> 1.12.3')
  gem.add_development_dependency('yard', '~> 0.8.6.2')
  gem.add_development_dependency('bluecloth', '~> 2.2.0')
  gem.add_runtime_dependency('faraday', '~> 0.8.7')
  gem.add_runtime_dependency('faraday_middleware', '~> 0.9.0')
  gem.add_runtime_dependency('multi_json', '~> 1.7.7')
  gem.add_runtime_dependency('hashie',  '~> 2.0.5')
  gem.authors       = ["Edgar Gonzalez"]
  gem.email         = ["edgargonzalez@gmail.com"]
  gem.description   = %q{A ruby wrapper for Citibikenyc API}
  gem.homepage      = "http://github.com/edgar/citibikenyc"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.summary       = %q{A ruby wrapper for Citibikenyc API}
  gem.name          = "citibikenyc"
  gem.require_paths = ["lib"]
  gem.version       = Citibikenyc::VERSION.dup
end

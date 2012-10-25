# -*- encoding: utf-8 -*-
require File.expand_path('../lib/activeform/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["James Hu"]
  gem.email         = ["axsuul@gmail.com"]
  gem.description   = %q{Forms with ActiveModel-like validations}
  gem.summary       = %q{Forms with ActiveModel-like validations}
  gem.homepage      = "http://www.github.com/axsuul/activeform"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "activeform"
  gem.require_paths = ["lib"]
  gem.version       = ActiveForm::VERSION

  gem.add_runtime_dependency "active_attr", ">= 0.5.0"
end

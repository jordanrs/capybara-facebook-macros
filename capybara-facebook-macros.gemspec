# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capybara-facebook-macros/version'

Gem::Specification.new do |gem|
  gem.name          = "capybara-facebook-macros"
  gem.version       = Capybara::Facebook::Macros::VERSION
  gem.authors       = ["Jordan Rogers-Smith"]
  gem.email         = ["jordan.rogers-smith@betapond.com"]
  gem.description   = %q{Adds a couple of convieniant macros for working with facebook in capybara}
  gem.summary       = %q{Adds a couple of convieniant macros for working with facebook in capybara}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

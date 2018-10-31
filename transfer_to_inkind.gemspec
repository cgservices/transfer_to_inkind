# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'inkind/version'

Gem::Specification.new do |gem|
  gem.name          = 'transfer_to_inkind'
  gem.version       = InkindApi::VERSION
  gem.authors       = ['Sander van Rossum']
  gem.email         = ['sander.van.rossum@cg.nl']
  gem.description   = 'Consumes TransferTo.com InKind API and provides ruby methods for the same'
  gem.summary       = 'Gem to consume TransferTo.com InKind API'
  gem.homepage      = ''
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency('dotenv', '~> 2.5')
  gem.add_dependency 'faraday'

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'pry-coolline'
  gem.add_development_dependency 'pry-nav'
  gem.add_development_dependency 'pry-rescue'
  gem.add_development_dependency 'pry-stack_explorer'
  gem.add_development_dependency('rake', ['>= 0'])
  gem.add_development_dependency('rspec', ['>= 0'])
  gem.add_development_dependency('rspec-rails', ['>= 0'])
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency('sqlite3', ['>= 0'])
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'webmock'
end

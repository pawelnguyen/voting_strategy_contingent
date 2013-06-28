# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'voting_strategy_contingent/version'

Gem::Specification.new do |spec|
  spec.name          = 'voting_strategy_contingent'
  spec.version       = VotingStrategyContingent::VERSION
  spec.authors       = ['pawelnguyen']
  spec.email         = ['pawel.nguyen@elpassion.pl']
  spec.description   = %q{Implements contingent vote strategy for voting systems.}
  spec.summary       = %q{Implements contingent vote strategy for voting systems.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end

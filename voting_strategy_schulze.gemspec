# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'voting_strategy_schulze/version'

Gem::Specification.new do |spec|
  spec.name          = 'voting_strategy_schulze'
  spec.version       = VotingStrategySchulze::VERSION
  spec.authors       = ['grzegorzkemski']
  spec.email         = ['grzegorz.kemski@elpassion.pl']
  spec.description   = %q{Implements Schulze strategy for voting systems.}
  spec.summary       = %q{Implements Schulze strategy for voting systems.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end

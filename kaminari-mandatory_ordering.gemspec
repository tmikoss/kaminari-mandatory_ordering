# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kaminari/mandatory_ordering/version'

Gem::Specification.new do |spec|
  spec.name          = 'kaminari-mandatory_ordering'
  spec.version       = Kaminari::MandatoryOrdering::VERSION
  spec.authors       = ['Toms Mikoss']
  spec.email         = ['toms.mikoss@gmail.com']

  spec.summary       = 'Makes sure ActiveRecord collections paged over by kaminari are ordered'
  spec.homepage      = 'https://github.com/tmikoss/kaminari-mandatory_ordering'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'kaminari', '>= 1.0'
  spec.add_dependency 'activerecord', '>= 4.0'
  spec.add_dependency 'activesupport', '>= 4.0'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'sqlite3', '>= 1.3'
end

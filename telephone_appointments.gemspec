# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'telephone_appointments/version'

Gem::Specification.new do |spec|
  spec.name          = 'telephone_appointments'
  spec.version       = TelephoneAppointments::VERSION
  spec.authors       = ['David Henry']
  spec.email         = ['david@decoybecoy.com']

  spec.summary       = 'Pension Guidance Telephone Appointment Planner API adapter'
  spec.homepage      = 'https://github.com/guidance-guarantee-programme/telephone_appointments'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport', '>= 4', '< 5.1'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
end

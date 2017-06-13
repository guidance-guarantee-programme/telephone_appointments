# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'telephone_appointments/version'

Gem::Specification.new do |spec|
  spec.name          = 'telephone_appointments'
  spec.version       = TelephoneAppointments::VERSION
  spec.authors       = ['Ben Lovell', 'David Henry']
  spec.email         = ['benjamin.lovell@gmail.com', 'david@decoybecoy.com']

  spec.summary       = 'Pension Guidance Telephone Appointment Planner API adapter'
  spec.homepage      = 'https://github.com/guidance-guarantee-programme/telephone_appointments'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport', '>= 4', '< 5.2'

  spec.add_development_dependency 'pry-byebug', '~> 3.4.2'
  spec.add_development_dependency 'rake', '~> 12.0.0'
  spec.add_development_dependency 'rspec', '~> 3.5.0'
  spec.add_development_dependency 'rubocop', '~> 0.47.1'
  spec.add_development_dependency 'vcr', '~> 3.0.3'
  spec.add_development_dependency 'webmock', '~> 2.3.2'
end

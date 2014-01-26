$:.push File.expand_path('../lib', __FILE__)

require 'extended_routes/version'

Gem::Specification.new do |s|
  s.name        = 'extended-routes'
  s.version     = ExtendedRoutes::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = 'Kyle Heddon'
  s.email       = 'ktheddon@gmail.com'
  s.summary     = 'A tool for routing between web applications'

  s.files        = Dir['{lib}/**/*.rb', '*.md']
  s.require_path = 'lib'

  s.add_development_dependency 'rake', '>= 0.8.7'
  s.add_development_dependency 'simplecov', '>= 0.7.1'
  s.add_development_dependency 'rspec', '>= 2.11'
  s.add_development_dependency 'rspec-pride', '~> 2.2.0'
  s.add_development_dependency 'pry', '~> 0.9.12.1'
end

require 'simplecov'
require 'pry'

SimpleCov.start do
  add_filter '/spec/'
end

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

require 'rubygems'
require 'extended_routes'

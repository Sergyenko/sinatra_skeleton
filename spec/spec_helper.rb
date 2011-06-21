require 'rubygems'
require 'bundler'

Bundler.setup

require 'rack/test'
ENV['RACK_ENV'] = 'test'

require File.expand_path('../../lib/application', __FILE__)

Spec::Runner.configure do |conf|
  conf.include Rack::Test::Methods
end

def app
  Application
end

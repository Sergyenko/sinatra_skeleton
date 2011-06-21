require 'rubygems'
require 'bundler'

Bundler.setup

#
require File.expand_path("../lib/application",__FILE__)

#
ENV['RACK_ENV'] ||= 'development'

#
run Application


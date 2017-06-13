require 'rubygems'
require 'bundler'

ENV['APP_ENV'] ||= 'development'

Bundler.setup
Bundler.require(:default, ENV['APP_ENV']) if defined?(Bundler)

#require_relative '../app/models/row'

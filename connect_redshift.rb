#!/usr/bin/env rvm 2.0 do ruby
require 'bundler/setup'
#Bundler.require
require 'active_record'
require 'active_support/all'
require 'pg'
require 'highline/import'   # used for command line interface
require_relative 'lib/config'
require_relative 'lib/yesno'
require 'date'
require 'set'

# lib/config.rb contains the host, database, etc.

# Get credentials from CLI

if @config[:user].nil? || @config[:user].length == 0
  @config[:user] = ask("Redshift username? ")
end

@config[:password] = ask("Redshift password? ") { |q| q.echo = "*" }

# Establish a connection
connection = ActiveRecord::Base.establish_connection(@config)
require_relative 'lib/base'

puts "Performing a query..."
# The below returns an ActiveRecord::Result object
result = Base.connection.select_all("SELECT * FROM foo WHERE bar='baz'")
p result
puts "DONE"

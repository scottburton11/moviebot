#!/usr/bin/ruby

# require 'rubygems'

require File.join(File.dirname(__FILE__), 'lib/movie_bot.rb')

Dir.glob(File.join(File.dirname(__FILE__), "lib/movie_bot/*.rb")).each {|file| require file}
Dir.glob(File.join(File.dirname(__FILE__), "vendor/*/lib/*.rb")).each {|file| require file}



# require 'csv'
# 
# extensions = []
# CSV.open("../../fixtures/image_formats.csv", "r") do |row|
#   extensions << row.split(",").first
# end

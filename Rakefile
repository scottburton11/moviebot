# -*- ruby -*-

# require 'rubygems'
# require 'hoe'
# require 'init.rb'
# 
# Hoe.new('MovieBot', MovieBot::VERSION) do |p|
#   p.author = "Scott Burton"
#   p.description = "A simple movie converter, queue and directory crawler, all in one!"
#   p.email = "scottburton11@gmail.com"
#   p.url = "github.com/scottburton11"
#   p.extra_deps = ["rvideo", "memcache", "starling"]
# end

# vim: syntax=Ruby

# Setup the gem
# desc "Cultivate the gem"
# task :cultivate do
#   system "touch Manifest.txt; rake check_manifest | grep -v \"(in \" | patch"
#   system "rake debug_gem | grep -v \"(in \" > `basename \\`pwd\\``.gemspec"
# end

begin
  require 'jeweler'
  require 'init'
  
  Jeweler::Tasks.new do |s|
    s.name = "MovieBot"
    s.summary = "A simple movie converter, queue and directory crawler, all in one!"
    s.email = "scottburton11@gmail.com"
    s.homepage = "http://wiki.github.com/scottburton11/moviebot/home"
    s.description = "A simple movie converter, queue and directory crawler, all in one!"
    s.authors = ["Scott Burton"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
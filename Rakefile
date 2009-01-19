require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rcov/rcovtask'

begin
  require 'jeweler'
  require 'lib/movie_bot'
  
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

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'MovieBot'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Rcov::RcovTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

task :default => :rcov

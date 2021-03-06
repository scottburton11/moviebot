# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{MovieBot}
  s.version = "0.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Scott Burton"]
  s.date = %q{2009-01-25}
  s.default_executable = %q{moviebot}
  s.description = %q{A simple movie converter, queue and directory crawler, all in one!}
  s.email = %q{scottburton11@gmail.com}
  s.executables = ["moviebot"]
  s.files = ["bin/moviebot", "lib/movie_bot", "lib/movie_bot/file_accessor.rb", "lib/movie_bot/image_converter.rb", "lib/movie_bot/media_file.rb", "lib/movie_bot/movie.rb", "lib/movie_bot/movie_maker.rb", "lib/movie_bot/queue_manager.rb", "lib/movie_bot.rb", "Rakefile", "vendor/im_magick"]
  s.homepage = %q{http://wiki.github.com/scottburton11/moviebot/home}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A simple movie converter, queue and directory crawler, all in one!}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

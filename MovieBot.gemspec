# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{MovieBot}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Scott Burton"]
  s.date = %q{2009-01-18}
  s.default_executable = %q{movie_bot}
  s.description = %q{A simple movie converter, queue and directory crawler, all in one!}
  s.email = %q{scottburton11@gmail.com}
  s.executables = ["movie_bot"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt", "vendor/im_magick/History.txt", "vendor/im_magick/License.txt", "vendor/im_magick/Manifest.txt"]
  s.files = [".DS_Store", ".git/COMMIT_EDITMSG", ".git/HEAD", ".git/ORIG_HEAD", ".git/config", ".git/description", ".git/hooks/applypatch-msg", ".git/hooks/commit-msg", ".git/hooks/post-commit", ".git/hooks/post-receive", ".git/hooks/post-update", ".git/hooks/pre-applypatch", ".git/hooks/pre-commit", ".git/hooks/pre-rebase", ".git/hooks/update", ".git/index", ".git/info/exclude", ".git/logs/HEAD", ".git/logs/refs/heads/master", ".git/logs/refs/remotes/origin/master", ".git/objects/02/e90c370dc24a7a5faf3cb0cbe5e58b19febe0e", ".git/objects/04/6905539f6d0af83c897b2cd1ca43685b53ed04", ".git/objects/04/9be2d2eca720234e0180bbaff51043409201f0", ".git/objects/05/3d41d2450b122904e18f5e60c7ac4b9fa2a7b4", ".git/objects/06/3710acc9a4e9536685e7a18c8e317e7789dfe0", ".git/objects/06/bd54f94349e6b516995ab7a545175e6c353f2b", ".git/objects/0b/ea68021e8eec252a1ebf8393de7d1348823112", ".git/objects/0c/b1f7e71cba2feb90971884b450135742ae0595", ".git/objects/0e/0a4673b1fdfa2a27af075dec3c3c463da167f8", ".git/objects/17/53616495233863cf5425d15a795944a54cfcfd", ".git/objects/23/9d9d4913f72d48733a41cd7d99df43870ef39b", ".git/objects/24/bca1d5aa65c12ef827cc01e51beb1c30115758", ".git/objects/26/210402a59450484d58eb1a1588c5aed7bb4cc2", ".git/objects/2a/5948e6d32ddd58d113ed9eb706f8cedb93c843", ".git/objects/33/834d430d16534ba883b5e40d2f355dd1b07630", ".git/objects/34/a12817bf1b781c9229d6f6151f1b24a6597d73", ".git/objects/42/2bdf8fcb2e7c1c5d346d4b60737014b6ed52d5", ".git/objects/43/0aa314997c1831928587b96f426231304e7f66", ".git/objects/4c/dd786262a18276f15a13f62abc42643cde89f7", ".git/objects/4e/ef0c7d15ebb3b9f235d94f7467c5c5762b7093", ".git/objects/5a/41ff2e41ae4797820c6003e343af076da56cbf", ".git/objects/5f/46e42ae75cc4ab3912045413d667daff565731", ".git/objects/60/525f0244bdd1c30868ade689c631a41a90ac0e", ".git/objects/60/bc4ce9a4fb4a90eecf061f7d3b6957350a240f", ".git/objects/66/75560b05ab8645598cd561ceca635d2ab29bce", ".git/objects/6c/683da13c02d1005caf48dfacdc7fb90d0775e0", ".git/objects/71/a5708be50bc914b98fe3105529946d503b084e", ".git/objects/73/7c4f8b387f8eabbd910296dea296a977a364a7", ".git/objects/7e/54f746e2e5b8872149234b9f493f474022b9ac", ".git/objects/7f/596c82e8655905c7446d4f58397785a29ed165", ".git/objects/85/2b05b0d7a2bb7bf125d3ef1dbbe624fe71d66a", ".git/objects/90/c2ac15f1cd0960bc2c80f87a663741d4d2355a", ".git/objects/94/457e6a420537beba1fd63f49d1e60897ec15ae", ".git/objects/95/f8eaef5ca189659be673fd4ba40ade9ddc94be", ".git/objects/98/5a8637ba350861d5dca2ee73ebb66a3525fd06", ".git/objects/99/48e7c51a0fe47ce9a2fb5a2dc42a6fc3c0b629", ".git/objects/9a/e61e6cee3fdd4448d3b662eda49e64704bdca7", ".git/objects/9c/74149447ad083c30365185a4ee513c679a7676", ".git/objects/9c/7d99bbfcdde8766ff3f62ae9bb9c5eff8423b8", ".git/objects/9e/42bfc540d99535f9276df69d033d1044056e9a", ".git/objects/9e/e7f3a9a93279d394af73ae553f675be89038a4", ".git/objects/af/9d97bbfd9293da698d1c6ee2fa3889e820641e", ".git/objects/b5/389542915827714cd22d72a575696b468e9c8c", ".git/objects/b7/2c74df3760557ea1cf489918d3f117a08563d1", ".git/objects/bc/9691b780f321bdd9b35a7d20d9c41321ef4357", ".git/objects/cc/a1cc612e00b953cfeb2d944f75fe0a9dfc4661", ".git/objects/cd/3972fe469dba432f6d67ec1798e7a9950bf34e", ".git/objects/cd/7e9be819ca55fb694b220f448ae33fea4d55de", ".git/objects/d3/89fde6c7245ced461b8e348580a332890f9a35", ".git/objects/db/08667e73b334062b7a0803fa5b5e3c2a3de40a", ".git/objects/dc/18c18e21799f0c64a0111dc74249986bd390e5", ".git/objects/e6/9de29bb2d1d6434b8b29ae775ad8c2e48c5391", ".git/objects/ea/37145e866919bb493bb78577a267fc54555ed4", ".git/objects/ef/63ac02adb9780c8e1c4758ec0b17024f8f3a4c", ".git/objects/f3/772947ab0764b1b3f389af0c9058d99929740b", ".git/objects/f6/9e8b80c2ad4e736d6e2fc528daf0c495dd80b6", ".git/objects/f6/ed5a183ffe6a9a3a0da0f644e727b7fba31e96", ".git/objects/f9/f60d0a8f94f19a9f55d4bcbfeaf7866207ada5", ".git/refs/heads/master", ".git/refs/remotes/origin/master", ".git/refs/tags/0.0.1", ".gitmodules", "History.txt", "Manifest.txt", "MovieBot.gemspec", "README.txt", "Rakefile", "bin/movie_bot", "fixtures/image_formats.csv", "fixtures/image_formats.yml", "init.rb", "lib/movie_bot.rb", "lib/movie_bot/image_converter.rb", "lib/movie_bot/movie_maker.rb", "lib/movie_bot/queue_manager.rb", "spec/movie_bot_spec.rb", "spec/spec_helper.rb", "test/test_movie_bot.rb", "vendor/im_magick/.git/HEAD", "vendor/im_magick/.git/config", "vendor/im_magick/.git/description", "vendor/im_magick/.git/hooks/applypatch-msg", "vendor/im_magick/.git/hooks/commit-msg", "vendor/im_magick/.git/hooks/post-commit", "vendor/im_magick/.git/hooks/post-receive", "vendor/im_magick/.git/hooks/post-update", "vendor/im_magick/.git/hooks/pre-applypatch", "vendor/im_magick/.git/hooks/pre-commit", "vendor/im_magick/.git/hooks/pre-rebase", "vendor/im_magick/.git/hooks/update", "vendor/im_magick/.git/index", "vendor/im_magick/.git/info/exclude", "vendor/im_magick/.git/logs/HEAD", "vendor/im_magick/.git/logs/refs/heads/master", "vendor/im_magick/.git/logs/refs/remotes/origin/master", "vendor/im_magick/.git/objects/pack/pack-53fa29483b3031c9a403ec9c13d6706b68ef081e.idx", "vendor/im_magick/.git/objects/pack/pack-53fa29483b3031c9a403ec9c13d6706b68ef081e.keep", "vendor/im_magick/.git/objects/pack/pack-53fa29483b3031c9a403ec9c13d6706b68ef081e.pack", "vendor/im_magick/.git/refs/heads/master", "vendor/im_magick/.git/refs/remotes/origin/HEAD", "vendor/im_magick/.git/refs/remotes/origin/master", "vendor/im_magick/.gitignore", "vendor/im_magick/History.txt", "vendor/im_magick/License.txt", "vendor/im_magick/Manifest.txt", "vendor/im_magick/README", "vendor/im_magick/Rakefile", "vendor/im_magick/config/hoe.rb", "vendor/im_magick/config/requirements.rb", "vendor/im_magick/lib/im_magick.rb", "vendor/im_magick/lib/im_magick/command/base.rb", "vendor/im_magick/lib/im_magick/command/collector.rb", "vendor/im_magick/lib/im_magick/command/composite.rb", "vendor/im_magick/lib/im_magick/command/convert.rb", "vendor/im_magick/lib/im_magick/command/emitter.rb", "vendor/im_magick/lib/im_magick/command/identify.rb", "vendor/im_magick/lib/im_magick/command/mogrify.rb", "vendor/im_magick/lib/im_magick/command/montage.rb", "vendor/im_magick/lib/im_magick/command/runner.rb", "vendor/im_magick/lib/im_magick/core_ext/class.rb", "vendor/im_magick/lib/im_magick/core_ext/string.rb", "vendor/im_magick/lib/im_magick/image.rb", "vendor/im_magick/lib/im_magick/image_info.rb", "vendor/im_magick/lib/im_magick/image_macros.rb", "vendor/im_magick/lib/im_magick/merbtasks.rb", "vendor/im_magick/lib/im_magick/util/geometry.rb", "vendor/im_magick/lib/im_magick/util/temp_file.rb", "vendor/im_magick/lib/im_magick/version.rb", "vendor/im_magick/script/destroy", "vendor/im_magick/script/generate", "vendor/im_magick/setup.rb", "vendor/im_magick/spec/fixtures/ImageMagick.jpg", "vendor/im_magick/spec/fonts/union.ttf", "vendor/im_magick/spec/fonts/unionbd.ttf", "vendor/im_magick/spec/im_magick_convert_spec.rb", "vendor/im_magick/spec/im_magick_image_info_spec.rb", "vendor/im_magick/spec/im_magick_spec.rb", "vendor/im_magick/spec/spec.opts", "vendor/im_magick/spec/spec_helper.rb", "vendor/im_magick/tasks/deployment.rake", "vendor/im_magick/tasks/environment.rake", "vendor/im_magick/tasks/rspec.rake", "vendor/im_magick/tasks/website.rake"]
  s.has_rdoc = true
  s.homepage = %q{github.com/scottburton11}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{moviebot}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{MovieBot is a wrapper for MEncoder, ffmpeg and Apple Compressor}
  s.test_files = ["test/test_movie_bot.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rvideo>, [">= 0"])
      s.add_runtime_dependency(%q<memcache>, [">= 0"])
      s.add_runtime_dependency(%q<starling>, [">= 0"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.2"])
    else
      s.add_dependency(%q<rvideo>, [">= 0"])
      s.add_dependency(%q<memcache>, [">= 0"])
      s.add_dependency(%q<starling>, [">= 0"])
      s.add_dependency(%q<hoe>, [">= 1.8.2"])
    end
  else
    s.add_dependency(%q<rvideo>, [">= 0"])
    s.add_dependency(%q<memcache>, [">= 0"])
    s.add_dependency(%q<starling>, [">= 0"])
    s.add_dependency(%q<hoe>, [">= 1.8.2"])
  end
end

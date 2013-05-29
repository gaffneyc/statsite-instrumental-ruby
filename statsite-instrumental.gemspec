require File.expand_path("../lib/instrumental/statsite/version", __FILE__)

# encoding: UTF-8
Gem::Specification.new do |s|
  s.name               = "statsite-instrumental"
  s.homepage           = "https://github.com/gaffneyc/statsite-instrumental"
  s.summary            = "Statsite sink for instrumentalapp.com"
  s.require_path       = "lib"
  s.authors            = ["Chris Gaffney"]
  s.email              = ["gaffneyc@gmail.com"]
  s.executables        = ["statsite-instrumental"]
  s.version            = Instrumental::Statsite::VERSION
  s.platform           = Gem::Platform::RUBY
  s.files              = Dir.glob("{lib,bin,spec}/**/*") + %w[LICENSE README.md]

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec",        "~> 2.11"

  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-bundler"
end

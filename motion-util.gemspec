# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "motion-util/version"

Gem::Specification.new do |s|
  s.name        = "motion-util"
  s.version     = Motion::Util::VERSION
  s.authors     = ["Katsuyoshi Ito"]
  s.email       = ["kito@itosoft.com"]
  s.homepage    = ""
  s.summary     = %q{Convenient command set for Ruby Motion.}
  s.description = %q{It generate class and spec files.}

  s.rubyforge_project = "motion-util"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end

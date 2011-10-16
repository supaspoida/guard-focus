# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "guard-focus/version"

Gem::Specification.new do |s|
  s.name        = "guard-focus"
  s.version     = Guard::Focus::VERSION
  s.authors     = ["Lar Van Der Jagt"]
  s.email       = ["lar@hashrocket.com"]
  s.homepage    = "http://github.com/supaspoida/guard-focus"
  s.summary     = %q{Autorun your specs & features with focus tags}
  s.description = %q{Replaces guard-rspec & guard-cucumber with a stripped down
                     version that will run with --tag @focus if any examples or
                     scenarios are tagged with 'focus'.}

  s.rubyforge_project = "guard-focus"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "guard"
end

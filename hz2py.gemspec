# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "hz2py"
  s.version     = "0.0.4"
  s.platform    = Gem::Platform::RUBY
  s.authors     = "elvuel"
  s.email       = "elvuel@gmail.com"
  s.homepage    = "http://github.com/elvuel"
  s.summary     = %q{汉字转拼音,汉字繁简转换－Chinese-Pinyin Conversion}
  s.description = %q{汉字转拼音实现, Chinese pinyin conversion. Chinese Traditional and Simplified conversion }

  s.rubyforge_project = "hz2py"
  s.add_development_dependency "rspec", "~> 1.3.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.has_rdoc      = false
end

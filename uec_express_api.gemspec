# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uec_express_api/version'

Gem::Specification.new do |gem|
  gem.name          = "uec_express_api"
  gem.version       = UecExpressApi::VERSION
  gem.authors       = ["henteko"]
  gem.email         = ["henteko07@gmail.com"]
  gem.description   = %q{API library of the University of Electro-Communications class cancellation information.}
  gem.summary       = %q{API library of the University of Electro-Communications class cancellation information.}
  gem.homepage      = "http://henteko07.hatenablog.com/"

  gem.rubyforge_project = "uec_express_api" 

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "hpricot"
end

# -*- encoding: utf-8 -*-
<<<<<<< HEAD
$:.push File.expand_path("../lib", __FILE__)
require "capistrano/version"

Gem::Specification.new do |s|

  s.name        = "capistrano"
  s.version     = Capistrano::Version.to_s
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jamis Buck", "Lee Hambley"]
  s.email       = ["jamis@jamisbuck.org", "lee.hambley@gmail.com"]
  s.homepage    = "http://github.com/capistrano/capistrano"
  s.summary     = %q{Capistrano - Welcome to easy deployment with Ruby over SSH}
  s.description = %q{Capistrano is a utility and framework for executing commands in parallel on multiple remote machines, via SSH.}
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.extra_rdoc_files = [
    "README.md"
  ]

  s.specification_version = 3 if s.respond_to? :specification_version

  if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    s.add_runtime_dependency(%q<highline>, [">= 0"])
    s.add_runtime_dependency(%q<net-ssh>, [">= 2.0.14"])
    s.add_runtime_dependency(%q<net-sftp>, [">= 2.0.0"])
    s.add_runtime_dependency(%q<net-scp>, [">= 1.0.0"])
    s.add_runtime_dependency(%q<net-ssh-gateway>, [">= 1.1.0"])
    s.add_development_dependency(%q<mocha>, ["0.9.12"])
  else
    s.add_dependency(%q<net-ssh>, [">= 2.0.14"])
    s.add_dependency(%q<net-sftp>, [">= 2.0.0"])
    s.add_dependency(%q<net-scp>, [">= 1.0.0"])
    s.add_dependency(%q<net-ssh-gateway>, [">= 1.1.0"])
    s.add_dependency(%q<highline>, [">= 0"])
    s.add_dependency(%q<mocha>, ["0.9.12"])
  end
=======
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/version'

Gem::Specification.new do |gem|
  gem.name          = "capistrano"
  gem.version       = Capistrano::VERSION
  gem.authors       = ["Tom Clements", "Lee Hambley"]
  gem.email         = ["seenmyfate@gmail.com", "lee.hambley@gmail.com"]
  gem.description   = %q{Capistrano is a utility and framework for executing commands in parallel on multiple remote machines, via SSH.}
  gem.summary       = %q{Capistrano - Welcome to easy deployment with Ruby over SSH}
  gem.homepage      = "http://capistranorb.com/"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = ['cap', 'capify']
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.licenses      = ['MIT']

  gem.post_install_message = "If you're updating Capistrano from 2.x.x, we recommend you to read the upgrade guide: http://www.capistranorb.com/documentation/upgrading/"

  #gem.signing_key = '/Volumes/SD Card/leehambley-private_key.pem'
  #gem.cert_chain  = ['capistrano-public_cert.pem', 'leehambley-public_cert.pem']

  gem.add_dependency 'sshkit', '>= 0.0.23'
  gem.add_dependency 'rake', '>= 10.0.0'
  gem.add_dependency 'i18n'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'mocha'
  gem.add_development_dependency 'vagrant', '~> 1.0.7'
  gem.add_development_dependency 'kuroko'
  gem.add_development_dependency 'cucumber'

>>>>>>> 8f436569fbbf55b246a385a1514f8bca85b28e13
end

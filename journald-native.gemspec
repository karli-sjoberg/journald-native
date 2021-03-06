# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'journald/native/version'

Gem::Specification.new do |spec|
  spec.name          = 'journald-native'
  spec.version       = Journald::Native::VERSION
  spec.authors       = ['Anton Smirnov']
  spec.email         = ['sandfox@sandfox.me']
  spec.summary       = 'systemd-journal logging native lib wrapper'
  spec.homepage      = 'https://github.com/sandfoxme/journald-native'
  spec.license       = 'LGPL-2.1+'

  spec.files         =
    # Get all files from git
    # Do not include full text of the license (there is a link),
    # dot files, tests
    `git ls-files -z`
    .split("\x0")
    .reject{ |file| %r{^(COPYING|\.|spec/)}.match? file }
  spec.require_paths = ['lib']

  spec.extensions << 'ext/journald_native/extconf.rb'

  spec.required_ruby_version = '>= 1.9.2'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rake-compiler'
  spec.add_development_dependency 'rspec', '~> 3.4'

  spec.requirements << 'systemd-journal'
  spec.requirements << 'systemd development package'
end

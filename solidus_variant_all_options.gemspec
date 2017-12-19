# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'solidus_variant_all_options/version'

Gem::Specification.new do |gem|
  gem.name          = "solidus_variant_all_options"
  gem.version       = SolidusVariantAllOptions::VERSION
  gem.authors       = ["German Garcia, Noel Díaz, 2bedigital"]
  gem.email         = ["geermc4@gmail.com, noel@2bedigital.com"]
  gem.summary      = "Adds button to generate all possible product combinations"
  gem.description  = "For products with multiple options, just click create all and remove a few if not needed"
  gem.homepage     = "https://github.com/geermc4/spree_variant_all_options"

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]

  solidus_version= '~> 2.1'
  gem.add_dependency 'solidus_api', solidus_version
  gem.add_dependency 'solidus_core', solidus_version
  gem.add_dependency 'solidus_frontend', solidus_version
  gem.add_dependency 'solidus_backend', solidus_version
end

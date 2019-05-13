$:.push File.expand_path('../lib', __FILE__)
require "deep_merge_existing_keys/version"

Gem::Specification.new do |spec|
  spec.name          = "deep_merge_existing_keys"
  spec.version       = DeepMergeExistingKeys::VERSION
  spec.authors       = ["Sébastien Gaya"]
  spec.email         = ["sebastien.gaya@gmail.com"]

  spec.summary       = %q{Extends Rails's deep_merge method to merge only existing keys.}
  spec.homepage      = "https://github.com/lespoupeesrusses/deep_merge_existing_keys"
  spec.license       = "MIT"

  spec.files = Dir['{lib,spec}/**/*', '.rspec', 'LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '>= 5.2'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

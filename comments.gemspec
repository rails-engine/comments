$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "comments/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "comments"
  s.version     = Comments::VERSION
  s.authors     = ["Jason Lee"]
  s.email       = ["huacnlee@gmail.com"]
  s.homepage    = "https://github.com/rails-engine/comments"
  s.summary     = "Comment feature for any applications's any models."
  s.description = "Comment feature for any applications's any models."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "README.md"]

  s.add_dependency "rails", ">= 4.2.0", "< 5.1"
  s.add_dependency 'will_paginate', '>= 3.0.0'
  s.add_dependency "awesome_nested_set", ">= 2.1.0"
end

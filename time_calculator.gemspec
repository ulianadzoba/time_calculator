$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "time_calculator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "time_calculator"
  spec.version     = TimeCalculator::VERSION
  spec.authors     = ["Uliana Dzoba"]
  spec.email       = ["ulianadzoba@gmail.com"]
  spec.homepage    = "https://rubygems.org/gems/time_calculator"
  spec.summary     = "Calculate days left to selected date"
  spec.description = "Helps cslculate time left."
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.4"
  spec.add_dependency "simple_form"
  spec.add_dependency "slim"

  spec.add_development_dependency "sqlite3"
end

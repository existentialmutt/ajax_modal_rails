$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ajax_modal_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ajax_modal_rails"
  s.version     = AjaxModalRails::VERSION
  s.authors     = ["Rafe Rosen"]
  s.email       = ["existentialmutt@gmail.com"]
  s.homepage    = "http://github.com/existentialmutt/ajax_modal_rails"
  s.summary     = "simple ajax-driven modals for rails"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4" #TODO relax version

  s.add_development_dependency 'coffee-rails' # TODO remove coffeescript dependency
  s.add_development_dependency 'sass-rails', '~> 5.0'  
  # s.add_development_dependency 'turbolinks', '~> 5'
  s.add_development_dependency 'jquery-rails'
  s.add_development_dependency 'bootstrap', '~> 4.0.0.beta'
  s.add_development_dependency 'rspec-rails', '~> 3.6'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'capybara', '>= 2.4'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'pry-rails'
end

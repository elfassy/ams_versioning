$:.push File.expand_path("../lib", __FILE__)

require "ams_versioning/version"

Gem::Specification.new do |s|
  s.name        = "ams_versioning"
  s.version     = AmsVersioning::VERSION
  s.authors     = ["Michael Elfassy"]
  s.email       = ["michaelelfassy@gmail.com"]
  s.homepage    = "github.com"
  s.summary     = "Add versioning to AMS"
  s.description = "Let Active Model Serializer support multiple API versions"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.0"
  s.add_dependency "active_model_serializers", "~> 0.10.0.rc2"

  s.add_development_dependency "sqlite3"
end

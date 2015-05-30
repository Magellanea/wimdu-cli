require 'active_record'
require 'yaml'

gem_directory = __dir__
RUBY_ENV = ENV['RUBY_ENV'] || 'development'
configuration = YAML::load(IO.read(
File.join(gem_directory, "..", "config", "databases.yml")))
ActiveRecord::Base.establish_connection(configuration[RUBY_ENV])

class Offer < ActiveRecord::Base
end

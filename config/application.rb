require 'active_record'
require 'sqlite3'
require 'yaml'
#require 'pry-byebug'
# This is some boilerplate code to read the config/database.yml file
# And connect to the database
config_path = File.join(File.dirname(__FILE__), "database.yml")
ActiveRecord::Base.configurations = YAML.load_file(config_path)
ActiveRecord::Base.establish_connection(:development)

# Set a logger so that you can view the SQL actually performed by ActiveRecord
# logger = Logger.new(STDOUT)
# logger.formatter = proc do |severity, datetime, progname, msg|
#    "#{msg}\n"
# end
# ActiveRecord::Base.logger = logger

# Load all models!
Dir["#{__dir__}/../app/models/*.rb"].each {|file| require file }

# Load all controllers!
Dir["#{__dir__}/../app/controllers/*.rb"].each {|file| require file }
# Load all views!
Dir["#{__dir__}/../app/views/*.rb"].each {|file| require file }

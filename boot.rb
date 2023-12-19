# frozen_string_literal: true
require "bundler/setup"
require "time"
require "oj"
MAX_PK = 10_000
QUERIES_MIN = 1
QUERIES_MAX = 500
SEQUEL_NO_ASSOCIATIONS = true

# Use the OJ gem instead of the JSON one
Oj.mimic_JSON()

SERVER_STRING =  Puma::Const::PUMA_SERVER_STRING

Bundler.require(:default) # Load core modules

def connect
  Bundler.require("postgresql") # Load database-specific modules

  opts = {}

  # Determine threading/thread pool size and timeout
  if defined?(Puma) &&
        (threads = Puma.cli_config.options.fetch(:max_threads)) > 1
    opts[:max_connections] = (2 * Math.log(threads)).floor
    opts[:pool_timeout] = 10
  else
    Sequel.single_threaded = true
  end

  Sequel.connect "%{adapter}:///%{database}" %
                   {
                     adapter: 'postgres',
                     host: "localhost",
                     database: ENV['DBNAME'],
                     #user: "benchmarkdbuser",
                     #password: "benchmarkdbpass"
                   },
                 opts
end

DB = connect 


class Table < Sequel.Model(ENV['TABLE'].to_sym)
  
end

[Table].each(&:freeze)
DB.freeze
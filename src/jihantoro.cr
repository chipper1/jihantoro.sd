require "kemal"
require "db"
require "sqlite3"
require "./jihantoro/routes.cr"
require "./jihantoro/config.cr"

module Jihantoro
  class Application
    def initialize
      # Make sure close sqlite connection when
      # application give exit status code
      at_exit { SQL.close }

      # Start serving with config.cr
      puts "Starting Kemal Server"
      Kemal.run
    end
  end
end

Jihantoro::Application.new

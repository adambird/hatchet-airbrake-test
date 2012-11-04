require 'sinatra'
# require 'airbrake'
require 'hatchet'
require 'hatchet_airbrake'

include Hatchet

Sinatra.register Hatchet

# Airbrake.configure do |config|
#   config.api_key = '1b081366c2c12e41cedf43e2fb11a4ff'
# end

Hatchet.configure do |config|
  config.appenders << Hatchet::AirbrakeAppender.new do |appender|
    appender.api_key   = '1b081366c2c12e41cedf43e2fb11a4ff'
  end
end

# use Airbrake::Rack
# enable :raise_errors

get "/" do
  begin
    raise "Sinatra has left the building"
  rescue => e
    logger.error "Hatchet got this", e
  end
end

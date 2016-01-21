require 'httparty'
require 'pry-byebug'
require 'figaro'
require 'pp'

Figaro.application = Figaro::Application.new(
  environment: "development",
  path: "config/application.yml"
  )
Figaro.load


class FreegeoAPI

  IP = Figaro.env.USER_IP
  BASE_URI = 'http://freegeoip.net/'

  def initialize
    @format = 'json'
  end

  def get_location
    sleep(0.5)
    @location_data = HTTParty.get(BASE_URI + @format + "/" + IP)
  end

  def city_state
    cityState = "#{@location_data['city']}, #{@location_data['region_code']}"
  end

end

# fg = FreegeoAPI.new

# pp fg.get_location
# pp fg.city_state
require 'httparty'
require 'glassdoor-api'
require 'pp'

Figaro.application = Figaro::Application.new(
  environment: "development",
  path: "config/application.yml")
Figaro.load



class GlassdoorAPI

  ID = Figaro.env.GLASSDOOR_ID
  KEY = Figaro.env.GLASSDOOR_KEY

  def initialize(location = "reno,us", days = 5)
     @options = { :query => {:q => location, :cnt => days, :APPID => ENV["APPID"]}}
     @gdapi = Glassdoor.new
  end

end

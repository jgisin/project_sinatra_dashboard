require 'httparty'
require 'pry-byebug'
require 'figaro'
require 'pp'

Figaro.application = Figaro::Application.new(
  environment: "development",
  path: "config/application.yml"
  )
Figaro.load



class GlassdoorAPI

  ID = Figaro.env.GLASSDOOR_ID
  KEY = Figaro.env.GLASSDOOR_KEY
  IP = Figaro.env.USER_IP
  BASE_URI = 'http://api.glassdoor.com/api/api.htm?'

  def initialize(location = "reno,us", days = 5)
     @options = { :query => {'v' => 1, 'format' => 'json', 't.p' => ID, 't.k' => KEY, 'userip' => IP, 'action' => 'employers'}}

  end

end


gd = GlassdoorAPI.new
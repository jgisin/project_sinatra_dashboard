require 'figaro'
require 'pp'

Figaro.application = Figaro::Application.new(
  environment: "development",
  path: "config/application.yml"
  )
Figaro.load


class GlassdoorAPI

  attr_accessor :company_data

  ID = Figaro.env.GLASSDOOR_ID
  KEY = Figaro.env.GLASSDOOR_KEY
  IP = Figaro.env.USER_IP
  BASE_URI = 'http://api.glassdoor.com/api/api.htm?'

  def initialize(company, location)
     @options = { :query => {'v' => 1, 'format' => 'json', 't.p' => ID, 't.k' => KEY, 'userip' => IP, 'action' => 'employers','q' => company, 'l' => location}}

  end

  def get_company
    sleep(0.5)
    @company_data = HTTParty.get(BASE_URI, @options)
  end

  def get_rating
    ratings = {}
    base_hash = @company_data['response']['employers'][0]
    ratings[:overallRating] = base_hash['overallRating']
    ratings[:cultureAndValuesRating] = base_hash['cultureAndValuesRating']
    ratings[:seniorLeadershipRating] = base_hash['seniorLeadershipRating']
    ratings[:compensationAndBenefitsRating] = base_hash['compensationAndBenefitsRating']
    ratings[:careerOpportunitiesRating] = base_hash['careerOpportunitiesRating']
    ratings[:workLifeBalanceRating] = base_hash['workLifeBalanceRating']
    ratings[:recommendToFriendRating] = base_hash['recommendToFriendRating']
    ratings
  end

  def get_featured_review
    featured = {}
    base_featured = @company_data['response']['employers'][0]['featuredReview']
    featured[:headline] = base_featured['headline']
    featured[:pros] = base_featured['pros']
    featured[:cons] = base_featured['cons']
    featured
  end

end


# gd = GlassdoorAPI.new('SalesTalent Inc','Mercer Island')
# gd.get_company
# pp gd.get_rating
# pp gd.get_featured_review

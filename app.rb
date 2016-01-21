require 'sinatra'
require 'sinatra/reloader'
require 'pry-byebug'
require 'thin'
require 'httparty'
require 'rubygems'
require 'bundler/setup'
require 'mechanize'
require 'pry-byebug'
require 'csv'
require_relative './dice_scraper.rb'
require_relative './glassdoor_scraper.rb'
require_relative './freegeo.rb'

@csv = nil
@dice = Dicescraper.new
@geo = FreegeoAPI.new


get '/' do

  erb :index
end

post '/' do
  
  @dice.search(params[:prompt], @geo.city_state)

  #params
    #scarper.search(param1, param2)

end
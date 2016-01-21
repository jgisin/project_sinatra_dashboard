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



get '/' do
  erb :index
end

post '/' do
  dice = DiceScraper.new
  geo = FreegeoAPI.new
  geo.get_location
  dice.output_csv(params[:prompt], geo.city_state)
  csv = CSV.read("dice.csv")

  erb :results, :locals => {:csv => csv}
end
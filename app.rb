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

csv = nil

get '/' do

  erb :index, :locals => {:csv => csv}
end

post '/' do

  #params
    #scarper.search(param1, param2)

end
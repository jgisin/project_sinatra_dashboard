require 'sinatra'
require 'sinatra/reloader'
require_relative 'web_scraper.rb'
require 'pry-byebug'

csv = CSV.read("csv_file.csv")

get '/' do
  erb :index, :locals => {:csv => csv}
end

require 'sinatra'
require 'sinatra/reloader'
require_relative 'web_scraper.rb'
require 'pry-byebug'
require 'thin'

csv = CSV.read("csv_file.csv")

get '/' do

  erb :index, :locals => {:csv => csv}
end

post '/' do

  #params
    #scarper.search(param1, param2)

end
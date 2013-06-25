require 'sinatra'
require 'sinatra/reloader' if development?
#Dont have to reload sinatra everytime we test functionality

#get root- '/' of webserver we run and do- the "ahoy smallfry" to display
get '/' do
  "Ahoy smallfry!"
end

get '/greetings_traveler' do
  "Greetin' matey"
end

get '/ahoy_me' do
  @me = "Wesley"
  return "Ahoy #{@me}"
end

#:name gives access to local variable called name
get '/ahoy_you/:name' do
  #name of the hash is always params[:___]
  @name = params[:name]
  return "Ahoy, #{@name}"
end

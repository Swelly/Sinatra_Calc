require 'sinatra'
require 'sinatra/reloader' if development?
#Dont have to reload sinatra everytime we test functionality

#get root of webserver we run and do- the "ahoy smallfry" to display
get '/' do
  "Ahoy smallfry!"
end

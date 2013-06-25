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

#localhost:4567/names/wesley/carr
get '/names/:first/:last' do
  @first = params[:first]
  @last = params[:last]
  return "You can do multiple parameters,
          #{@first.capitalize} #{@last.capitalize}!"
end

#localhost:4567/calc/add/1/2
get '/calc/add/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  return (@first + @second).to_s
end

get '/calc/subtract/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  return (@first - @second).to_s
end

#Returns the product of two numbers
# localhost:4567/calc/multiply/5/10
get '/calc/multiply/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  return (@first * @second).to_s
end

get '/calc/divide/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  return (@first / @second).to_s
end

get '/oh_ahoy/:name' do
  @answer_to_universe = 42
  @name = params[:name]
  #returns [erb] template named ahoy
  erb(:ahoy)
end

get '/calc/:first/:operation/:second' do
  @first = params[:first].to_f
  @operation = params[:operation]
  @second = params[:second].to_f
  @result = case @operation
  when "sum" then @first + @second
  when "difference" then @first - @second
  when "product" then @first  * @second
  when "quotient" then @first / @second
  end
  erb (:calc)
end

get '/calc/form' do
  @first = params[:first].to_f
  @operation = params[:operation]
  @second = params[:second].to_f
  @result = case @operation
  when "sum" then @first + @second
  when "difference" then @first - @second
  when "product" then @first  * @second
  when "quotient" then @first / @second
  end
  erb (:calc_form)
end

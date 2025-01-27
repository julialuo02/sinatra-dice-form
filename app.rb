require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :index
end

get '/process_roll' do
  dice = params[:dice].to_i
  sides = params[:sides].to_i
  
  if dice > 0 && sides > 0
    @dice = dice
    @sides = sides
    @results = Array.new(dice) { rand(1..sides) }
    erb :process_roll
  else
    @error = "Please enter valid positive integers for the number of dice and sides."
    erb :error
  end
end

require 'sinatra'
require_relative 'models/stock_ticker_loader'
require 'csv'

get '/' do
	
	erb :index
end


get '/game' do
	#start game, reset everything to blank and pass variable out
	game = StockTicketLoader.new
	@symbol = game.populate_game.to_a.shuffle.pop
	erb :game
end

post '/game' do
	arrayify = params.to_a

	stocks = StockTicketLoader.new
	@right = stocks.compare_guess(arrayify[0])
	#get new ticker/company hash
	erb :didyouwin
end

set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'



# To DO list
# 1 Display if i won or lost on the same page as the ticker guess
# 2 make a method to give me a rand ticker symbol/company pair 
# 		MAKE METHOD--  game.populate_game.to_a.shuffle.pop
# 3 Style the forms and the background
# 4	GAME SCORE
# 	--1 add a value in the froms that represents the current SCORE
# 5 DISPLAY CORRECT TicKER IF YOU GET IT WRONG
# 6 remove each stock after getting it right
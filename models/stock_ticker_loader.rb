require 'csv'
require 'pry'

class StockTicketLoader
 
	def initialize(file_name = 'public/stocks.csv')
		@company_tickers = {}
		@file_name = file_name
	end

	def populate_game
		CSV.foreach(@file_name, headers: true, :header_converters => :symbol, :converters => :all) do |row|
			@company_tickers[row[:ticker]]=row[:company]
 		end
 		@company_tickers
	end

	def compare_guess(params)
		ticker_guessed = params[1].upcase
		company_guessed =params[0]

		@company_tickers = populate_game
		#if they got the ticker symbol right
		if @company_tickers.has_key?(ticker_guessed)
			#compares if the ticker is actually the company that it represents
			return @company_tickers[ticker_guessed] == company_guessed
		else
			return false
		end
	end

end
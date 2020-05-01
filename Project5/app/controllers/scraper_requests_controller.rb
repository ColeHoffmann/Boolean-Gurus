
class ScraperRequestsController < ApplicationController


	def index
		Rails.application.load_seed
		redirect_to '/'
	end


end
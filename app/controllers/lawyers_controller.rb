require 'csv'
class LawyersController < ApplicationController

	def index
	    @lawyer_cities = LawyerCity.all.uniq
	    @lawyer_services = LawyerService.all.uniq
	end


	def process_lawyers
    	@lawyers = LawyerCity.where("city LIKE ?","%#{params[:city]}%").joins(:lawyer_services).where("lawyer_services.service_name LIKE ?","%#{params[:service]}%").all
    	if @lawyers.empty?
    		flash[:error] = "No lawyers found"
    	else
    		flash[:error] = nil
    	end
	end
end
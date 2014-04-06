require 'csv'
class LawyersController < ApplicationController

	def index
	    @lawyer_cities = LawyerCity.all
	    @lawyer_services = LawyerService.all

	    @lawyer_cities = @lawyer_cities.uniq.pluck(:city)
	    @lawyer_services = @lawyer_services.uniq.pluck(:service_name)
	end


	def process_lawyers
		@search_params = params[:service];

    	@lawyers = LawyerCity.where("city LIKE ?","%#{params[:city]}%").joins(:lawyer_services).where("lawyer_services.service_name in (?)",params[:service]).all
    	if @lawyers.empty?
    		flash[:error] = "No lawyers found"
    	else
    		flash[:error] = nil
    	end
	end
end
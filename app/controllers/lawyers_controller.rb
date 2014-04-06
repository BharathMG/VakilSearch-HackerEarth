require 'csv'
class LawyersController < ApplicationController

	def index

		@lawyer_cities = LawyerCity.all

		if(@lawyer_cities.empty?)
		csv = process_csv('Lawyer_Cities_List.csv')
	    csv.each do |row|
	      LawyerCity.create!(row.to_hash)
	    end
		end

		@lawyer_services = LawyerService.all

		if(@lawyer_services.empty?)
	    csv_text = process_csv('Lawyer_Service_List.csv')
	    csv.each do |row|
	      code = row["code"]
	      unique_id = LawyerCity.find_by_code(code)
	      @service = LawyerService.create(row.to_hash)
	      @service.lawyer_city_id = unique_id.id
	      @service.save!
	    end
		end

	    @lawyer_cities = LawyerCity.all
	    @lawyer_services = LawyerService.all
		
	end


	def process_lawyers
    	@lawyers = LawyerCity.where("city LIKE ?","%#{params[:city]}%").joins(:lawyer_services).where("lawyer_services.service_name LIKE ?","%#{params[:service]}%").all

    	if @lawyers.empty?
    		flash[:error] = "No lawyers found"
    	else
    		flash[:error] = nil
    	end
    
	end

	private
	def process_csv(file)
		csv_text = File.read(file)
	    csv = CSV.parse(csv_text, :headers => true)
	    csv
	end
end
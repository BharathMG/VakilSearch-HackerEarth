require 'csv'
class LawyersController < ApplicationController
	def index

		@lawyer_cities = LawyerCity.all

		if(@lawyer_cities.empty?)
		csv_text = File.read('Lawyers_City_List.csv')
	    csv = CSV.parse(csv_text, :headers => true)
	    csv.each do |row|
	      LawyerCity.create!(row.to_hash)
	    end
		end

		@lawyer_services = LawyerService.all

		if(@lawyer_services.empty?)
	    csv_text = File.read('Lawyer_Service_List.csv')
	    csv = CSV.parse(csv_text, :headers => true)
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
		# where("name LIKE ? AND city = ?", "#{params[:name]}%", params[:cityId])
		# @lawyer_services = LawyerService.all.where("service_name LIKE ?","%#{params[:service]}%")
    	@lawyer_cities = LawyerCity.all.where("city LIKE ?","%#{params[:city]}%")


    	@results = @lawyer_cities
    	@lawyer_services = []
    	@results.each do |result|
    		@finals = result.lawyer_services.where("service_name LIKE ?","%#{params[:service]}%")
    		if(!@finals.empty?)
    		data = []
			@finals.each do |row|
			 data << {:city => result.city, :ratings => result.rating,:service_code => row[:service_code], :service_name => row[:service_name], :charges => row[:charges], :name => result.name}
			end
    		
    		@lawyer_services << data
    		puts @lawyer_services.inspect
    		end
    	end

    	if @lawyer_services.empty?
    		flash[:error] = "No lawyers found"
    	else
    		flash[:error] = nil
    	end
    	# puts @lawyer_cities

    	
	end
end
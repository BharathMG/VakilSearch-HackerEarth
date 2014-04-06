module LawyerHelperMethods
	def process_lawyer_services(lawyer_cities)
	  @results = lawyer_cities
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

      @lawyer_services
	end
end
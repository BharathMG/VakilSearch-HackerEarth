require 'csv'
namespace :populate_db do
  desc "Populate lawyers cities DB"
  task city: :environment do
  	csv = process_csv('Lawyers_City_List.csv')
    csv.each do |row|
      LawyerCity.create!(row.to_hash)
    end
  end

  desc "Populate lawyers services DB"
  task service: :environment do
  	csv = process_csv('Lawyer_Service_List.csv')
    csv.each do |row|
      code = row["code"]
      unique_id = LawyerCity.find_by_code(code)
      @service = LawyerService.create(row.to_hash)
      @service.lawyer_city_id = unique_id.id
      @service.save!
    end
  end

end

def process_csv(file)
		csv_text = File.read(file)
	    csv = CSV.parse(csv_text, :headers => true, :header_converters=> lambda {|f| f.strip},
   :converters=> lambda {|f| f ? f.strip : nil})
	    csv
	end

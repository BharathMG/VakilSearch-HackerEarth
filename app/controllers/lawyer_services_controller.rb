require 'csv'
class LawyerServicesController < ApplicationController
  before_action :set_lawyer_service, only: [:show, :edit, :update, :destroy]

  # GET /lawyer_services
  # GET /lawyer_services.json
  def index
    csv_text = File.read('Lawyer_Service_List.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      LawyerService.create!(row.to_hash)
    end
    @lawyer_services = LawyerService.all
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lawyer_service
      @lawyer_service = LawyerService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lawyer_service_params
      params.require(:lawyer_service).permit(:code, :service_code, :service_name, :charges)
    end
end

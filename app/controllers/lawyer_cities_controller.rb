class LawyerCitiesController < ApplicationController
  include LawyerHelperMethods
  before_action :set_lawyer_city, only: [:show, :edit, :update, :destroy]

  def index
    @lawyer_cities = LawyerCity.all
    @services_count = []
    @lawyer_cities.each do |lawyer|
      total_services = lawyer.lawyer_services.count
      @services_count << total_services
    end
  end

  
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lawyer_city
      @lawyer_city = LawyerCity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lawyer_city_params
      params.require(:lawyer_city).permit(:code, :name, :experience, :city, :rating)
    end
end

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

  # GET /lawyer_services/1
  # GET /lawyer_services/1.json
  def show
  end

  # GET /lawyer_services/new
  def new
    @lawyer_service = LawyerService.new
  end

  # GET /lawyer_services/1/edit
  def edit
  end

  # POST /lawyer_services
  # POST /lawyer_services.json
  def create
    @lawyer_service = LawyerService.new(lawyer_service_params)

    respond_to do |format|
      if @lawyer_service.save
        format.html { redirect_to @lawyer_service, notice: 'Lawyer service was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lawyer_service }
      else
        format.html { render action: 'new' }
        format.json { render json: @lawyer_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lawyer_services/1
  # PATCH/PUT /lawyer_services/1.json
  def update
    respond_to do |format|
      if @lawyer_service.update(lawyer_service_params)
        format.html { redirect_to @lawyer_service, notice: 'Lawyer service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lawyer_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lawyer_services/1
  # DELETE /lawyer_services/1.json
  def destroy
    @lawyer_service.destroy
    respond_to do |format|
      format.html { redirect_to lawyer_services_url }
      format.json { head :no_content }
    end
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

require 'csv'    

class LawyerCitiesController < ApplicationController
  before_action :set_lawyer_city, only: [:show, :edit, :update, :destroy]

  # GET /lawyer_cities
  # GET /lawyer_cities.json
  def index
    csv_text = File.read('Lawyers_City_List.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      LawyerCity.create!(row.to_hash)
    end
    @lawyer_cities = LawyerCity.all
  end

  # GET /lawyer_cities/1
  # GET /lawyer_cities/1.json
  def show
  end

  # GET /lawyer_cities/new
  def new
    @lawyer_city = LawyerCity.new
  end

  # GET /lawyer_cities/1/edit
  def edit
  end

  # POST /lawyer_cities
  # POST /lawyer_cities.json
  def create
    @lawyer_city = LawyerCity.new(lawyer_city_params)

    respond_to do |format|
      if @lawyer_city.save
        format.html { redirect_to @lawyer_city, notice: 'Lawyer city was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lawyer_city }
      else
        format.html { render action: 'new' }
        format.json { render json: @lawyer_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lawyer_cities/1
  # PATCH/PUT /lawyer_cities/1.json
  def update
    respond_to do |format|
      if @lawyer_city.update(lawyer_city_params)
        format.html { redirect_to @lawyer_city, notice: 'Lawyer city was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lawyer_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lawyer_cities/1
  # DELETE /lawyer_cities/1.json
  def destroy
    @lawyer_city.destroy
    respond_to do |format|
      format.html { redirect_to lawyer_cities_url }
      format.json { head :no_content }
    end
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

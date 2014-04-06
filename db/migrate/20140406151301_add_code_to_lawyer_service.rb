class AddCodeToLawyerService < ActiveRecord::Migration
  def change
  	add_column :lawyer_services, :code, :string
  end
end

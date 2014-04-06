class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :lawyer_services, :code, :lawyer_city_id
  end
end

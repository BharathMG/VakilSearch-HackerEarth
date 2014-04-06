class CreateLawyerServices < ActiveRecord::Migration
  def change
    create_table :lawyer_services do |t|
      t.string :code
      t.string :service_code
      t.string :service_name
      t.string :charges

      t.timestamps
    end
  end
end

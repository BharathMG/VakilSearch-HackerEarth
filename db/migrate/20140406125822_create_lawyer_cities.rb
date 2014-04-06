class CreateLawyerCities < ActiveRecord::Migration
  def change
    create_table :lawyer_cities do |t|
      t.string :code
      t.text :name
      t.integer :experience
      t.text :city
      t.decimal :rating

      t.timestamps
    end
  end
end

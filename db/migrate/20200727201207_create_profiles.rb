class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :school
      t.string :license_number
      t.string :speciality
      t.integer :price

      t.timestamps
    end
  end
end

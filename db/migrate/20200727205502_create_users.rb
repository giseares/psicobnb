class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.boolean :proffesional
      t.string :email
      t.string :available_at
      t.string :first_name
      t.string :last_name
      t.string :password
      t.integer :dni
      t.string :address
      t.string :cel_phone

      t.timestamps
    end
  end
end

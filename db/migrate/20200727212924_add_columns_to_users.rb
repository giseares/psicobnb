class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :professional, :boolean
    add_column :users, :available_at, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :password, :string
    add_column :users, :address, :string
    add_column :users, :cel_phone, :string
    add_column :users, :dni, :string
  end
end

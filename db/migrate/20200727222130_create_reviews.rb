class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :appointment, null: false, foreign_key: true
      t.integer :rating_sharp
      t.integer :rating_qualityprice
      t.integer :rating_facilities

      t.timestamps
    end
  end
end

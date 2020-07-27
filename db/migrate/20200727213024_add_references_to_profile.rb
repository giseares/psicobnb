class AddReferencesToProfile < ActiveRecord::Migration[6.0]
  def change
    add_reference :profiles, :user
  end
end
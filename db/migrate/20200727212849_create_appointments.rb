class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.bigint :client_id, foreing_key: true, index: true
      t.bigint :professional_id, foreing_key: true, index: true
      t.date :appointment_date
      t.integer :start_hour
      t.string :status
      t.integer :session_price

      t.timestamps
    end
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :appointments, foreign_key: :client_id
  has_many :reservations, foreign_key: :professional_id, class_name: "Appointment"
end

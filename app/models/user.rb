class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments, foreign_key: :client_id
  has_many :reservations, foreign_key: :professional_id, class_name: "Appointment"
  after_create :create_profile

  def create_profile
    profile = Profile.new(user_id: id)
    profile.save
  end
end

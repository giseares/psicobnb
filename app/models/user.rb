class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments, foreign_key: :client_id
  has_many :reservations, foreign_key: :professional_id, class_name: "Appointment"
  has_many :reviews, through: :reservations
  after_create :create_profile
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def create_profile
    profile = Profile.new(user_id: id)
    profile.save
  end
end

class Profile < ApplicationRecord
  belongs_to :user
  validates :speciality, presence: true
end

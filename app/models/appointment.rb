class Appointment < ApplicationRecord
  belongs_to :client, class_name: "User"
  belongs_to :professional, class_name: "User"
end


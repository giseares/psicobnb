class Appointment < ApplicationRecord
  belongs_to :client, class_name: "User"
  belongs_to :professional, class_name: "User"
  has_one :review
  validate :appointment_date_cannot_be_in_the_past
  


  def appointment_date_cannot_be_in_the_past
    if appointment_date.present? && appointment_date < Date.today
      errors.add( :appointment_date,"La fecha a seleccionar no puede ser menor a hoy")
    end
  end
end

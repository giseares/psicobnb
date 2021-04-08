# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
require 'faker'
puts 'start seed'

 #--- Seed usuario de prueba----
user = User.new(email: 'user@user.com', professional: false, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Address.street_address, cel_phone: Faker::PhoneNumber.cell_phone_in_e164, dni: Faker::Number.number(digits: 8), password: '123456')
avatar_url = 'https://i.pravatar.cc/300'
avatar = URI.open(avatar_url)

user.photo.attach(io: avatar, filename: "#{user.first_name}#{user.last_name}", content_type: 'image/jpg')
user.save!

#--- Seed psicologo de prueba----
psyco = User.new(email: 'psico@psico.com', professional: true, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Address.street_address, cel_phone: Faker::PhoneNumber.cell_phone_in_e164, dni: Faker::Number.number(digits: 8), password: '123456')
avatar_url2 = 'https://i.pravatar.cc/300'
avatar2 = URI.open(avatar_url2)

psyco.photo.attach(io: avatar2, filename: "#{psyco.first_name}#{psyco.last_name}", content_type: 'image/jpg')
psyco.save!
profile2 = Profile.find_by user_id: psyco.id
profile2.update(school: 'Humanismo', license_number:  Faker::Number.number(digits: 6), speciality: "Social", price: 600)

SCHOOLS = ['Estructuralismo', 'Funcionalismo', 'Psicoanalisis', 'Conductismo', 'Humanismo', 'Cognotivismo']
SPECIALITY = ['Psicologia Social', 'Psicologia de Familia', 'Psicologia de Parejas', 'Psicologia del Deporte', 'Psicologia Forense', 'Psicologia Clinica', 'Psicologia Organizacional', 'Psicologia Educativa', 'Neuropsicologia']

7.times do
  p_users = User.new(email: Faker::Internet.email, professional: true, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Address.street_address, cel_phone: Faker::PhoneNumber.cell_phone_in_e164, dni: Faker::Number.number(digits: 8), password: '123456')
  #--- avatar----
  avatar_url = 'https://i.pravatar.cc/300'
  avatar = URI.open(avatar_url)
  p_users.photo.attach(io: avatar, filename: "#{p_users.first_name}#{p_users.last_name}", content_type: 'image/jpg')
  #---- avatar ----
  p_users.save!
  profile = Profile.find_by user_id: p_users.id
  profile.update(school: SCHOOLS.sample, license_number:  Faker::Number.number(digits: 6), speciality: SPECIALITY.sample, price: 600)
  
  p p_users
  p profile
end
10.times do
  c_users = User.new(email: Faker::Internet.email, professional: false, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, address: Faker::Address.street_address, cel_phone: Faker::PhoneNumber.cell_phone_in_e164, dni: Faker::Number.number(digits: 8), password: '123456')
  c_users.save!
  p c_users
end
22.times do
  appointment = Appointment.new(appointment_date: Faker::Date.in_date_period, start_hour: 18, status: "Pendiente de confirmar", session_price: 600)
  appointment.client_id = User.where(professional: false).sample.id # ver
  appointment.professional_id = User.where(professional: true).sample.id
  appointment.save!
end
25.times do 
  review = Review.new(rating_sharp: [1,2,3,4,5].sample, rating_facilities: [1,2,3,4,5].sample, rating_qualityprice: [1,2,3,4,5].sample)
  review.appointment_id = Appointment.all.sample.id
  review.save!
end

# user ------------------------
# email
# t.string "encrypted_password", default: "", null: false
# t.string "available_at"
# t.string "first_name"
# t.string "last_name"
# t.string "address"
# t.string "cel_phone"
# t.string "dni"
#-------------------------------
# appointment ------------------------
# t.bigint "client_id"
# t.bigint "professional_id"
# t.date "appointment_date"
# t.integer "start_hour"
# t.string "status"
# t.integer "session_price"
#-------------------------------
# profile ------------------------
# t.string "school"
# t.string "license_number"
# t.string "speciality"
# t.integer "price"
# t.bigint "user_id"
#-------------------------------
# profile ------------------------
# t.bigint "appointment_id", null: false
# t.integer "rating_sharp"
# t.integer "rating_qualityprice"
# t.integer "rating_facilities"
#-------------------------------
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#   ingredient = Ingredient.new(name: drink.values[0])
#   ingredient.save!
#   p ingredient
# end
# file = URI.open('https://res.cloudinary.com/julianoviedo1/image/upload/v1595618936/mintjulep_b4jbzh.png')
# a = Cocktail.new(name: 'Mint Julep')
# a.photo.attach(io: file, filename: 'mintjulep_b4jbzh.png', content_type: 'image/png')
# a.save!
# fileb = URI.open('https://res.cloudinary.com/julianoviedo1/image/upload/v1595619138/536914-PJIWWP-191_iwhn4b.jpg')
# b = Cocktail.new(name: 'Tequila')
# b.photo.attach(io: fileb, filename: '536914-PJIWWP-191_iwhn4b.jpg', content_type: 'image/jpg')
# b.save!
# filec = URI.open('https://res.cloudinary.com/julianoviedo1/image/upload/v1595618933/daiquiri.jpg')
# c = Cocktail.new(name: 'Daiquiri')
# c.photo.attach(io: filec, filename: 'daiquiri.jpg', content_type: 'image/png')
# c.save!

# puts 'finish seed'

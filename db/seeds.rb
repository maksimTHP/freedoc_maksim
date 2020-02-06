require 'faker'

Doctor.destroy_all
Patient.destroy_all
Appointment.destroy_all
City.destroy_all
JoinTableDoctorSpecialty.destroy_all
Specialty.destroy_all

10.times do
City.create(city: Faker::Address.city)
end

10.times do
Specialty.create(specialty: Faker::Job.field)
end


30.times do
Doctor.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  zip_code: Faker::Address.zip_code,
  city_id: City.find(rand(City.first.id..City.last.id)).id
)
end

30.times do
JoinTableDoctorSpecialty.create(
  doctor_id: Doctor.find(rand(Doctor.first.id..Doctor.last.id)).id,
  specialty_id: Specialty.find(rand(Specialty.first.id..Specialty.last.id)).id
)
end


55.times do
Patient.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  city_id: City.find(rand(City.first.id..City.last.id)).id
)
end

100.times do
Appointment.create(
  date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 50),
  doctor_id: Doctor.find(rand(Doctor.first.id..Doctor.last.id)).id,
  patient_id: Patient.find(rand(Patient.first.id..Patient.last.id)).id,
  city_id: City.find(rand(City.first.id..City.last.id)).id
)
end

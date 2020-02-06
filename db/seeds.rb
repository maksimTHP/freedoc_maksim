require 'faker'

Doctor.delete_all
Patient.delete_all
Appointment.delete_all


30.times do
Doctor.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  specialty: Faker::University.name,
  zip_code: Faker::Address.zip
)
end

30.times do
Patient.create(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name
)
end

45.times do
  Appointment.create(
    patient_id: Patient.find(rand(Patient.first.id..Patient.last.id)).id,
    doctor_id: Doctor.find(rand(Doctor.first.id..Doctor.last.id)).id,
    date: Faker::Time.forward(days: 23, period: :morning)
  )
end

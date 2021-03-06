namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando BD...') { `rails db:drop` }
      show_spinner('Criando BD...') { `rails db:create` }
      show_spinner('Migrando BD...') { `rails db:migrate` }
      show_spinner('Criando Usuário para doutor...') { `rails dev:add_default_doctor` }
      show_spinner('Criando Usuário para paciente...') { `rails dev:add_default_patient` }
      show_spinner('Adicionando Usuário para doutores extras...') { `rails dev:add_extra_doctor` }
      show_spinner('Adicionando Usuário para pacientes extras...') { `rails dev:add_extra_patient` }
      show_spinner('Adicionando novas Consultas...') { `rails dev:add_appointment` }
    else
      puts 'Você não está em ambiente de desenvolvimento!'
    end
  end

  desc 'Adicionando usuário para doutor'
  task add_default_doctor: :environment do
    Doctor.create!(
      name: Faker::Name.name,
      crm: Faker::Code.rut,
      crm_uf: 'MT',
      email: 'doctor@doctor.com',
      password: 'doctor123',
      password_confirmation: 'doctor123'
    )
  end

  desc 'Adicionando usuário para patient'
  task add_default_patient: :environment do
    Patient.create!(
      name: Faker::Name.name,
      birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
      cpf: Faker::IDNumber.brazilian_citizen_number,
      email: 'patient@patient.com',
      password: 'patient123',
      password_confirmation: 'patient123'
    )
  end

  desc 'Adicionando Usuário para pacientes extras'
  task add_extra_patient: :environment do
    10.times do |_i|
      Doctor.create!(
        name: Faker::Name.name,
        crm: Faker::Code.rut,
        crm_uf: 'MS',
        email: Faker::Internet.email,
        password: 'doctor123',
        password_confirmation: 'doctor123'
      )
    end
  end

  desc 'Adicionando Usuário para pacientes extras'
  task add_extra_doctor: :environment do
    10.times do |_i|
      Patient.create!(
        name: Faker::Name.name,
        birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
        cpf: Faker::IDNumber.brazilian_citizen_number,
        email: Faker::Internet.email,
        password: 'patient123',
        password_confirmation: 'patient123'
      )
    end
  end

  desc 'Adicionando novas Consultas'
  task add_appointment: :environment do
    10.times do |_i|
      Appointment.create!(
        doctor_id: @appointment.doctor_id,
        patient_id: @appointment.patient_id,
        starts_at: Faker::Date.in_date_period(year: 2018, month: 2),
        ends_at: Faker::Date.in_date_period(year: 2021, month: 12)
      )
    end
  end

  private

  def show_spinner(msg_start, msg_end = 'Concluído!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end

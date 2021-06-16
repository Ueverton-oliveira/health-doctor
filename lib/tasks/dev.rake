namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Criando Usuário para doutor...") { %x(rails dev:add_default_doctor) }
      show_spinner("Criando Usuário para paciente...") { %x(rails dev:add_default_patient) }
      show_spinner("Adicionando Usuário para doutores extras...") { %x(rails dev:add_extra_doctor) }
      show_spinner("Adicionando Usuário para pacientes extras...") { %x(rails dev:add_extra_patient) }
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Adicionando usuário para doutor"  
  task add_default_doctor: :environment do
    Doctor.create!(
      name: Faker::Name.name, 
      crm: Faker::Code.rut,
      crm_uf: "MT",
      email: 'doctor@doctor.com',
      password: 'doctor123',
      password_confirmation: 'doctor123'

    )
  end

  desc "Adicionando usuário para patient"  
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

  desc "Adicionando Usuário para pacientes extras"  
  task add_extra_patient: :environment do
    10.times do |i|
      Doctor.create!(
        name: Faker::Name.name, 
        crm: Faker::Code.rut,
        crm_uf: "MS",
        email: Faker::Internet.email,
        password: 'doctor123',
        password_confirmation: 'doctor123'
      )
    end
  end

  desc "Adicionando Usuário para pacientes extras"  
  task add_extra_doctor: :environment do
    10.times do |i|
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

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end

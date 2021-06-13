namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD...") { %x(rails db:drop) }
      show_spinner("Criando BD...") { %x(rails db:create) }
      show_spinner("Migrando BD...") { %x(rails db:migrate) }
      show_spinner("Criando o Usuário para doutor...") { %x(rails dev:add_default_doctor) }
      show_spinner("Criando o Usuário para paciente...") { %x(rails dev:add_default_patient) }

    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  desc "Adicionando usuário para doutor"  
  task add_default_doctor: :environment do
    Doctor.create!(
      email: 'doctor@doctor.com',
      password: 'doctor123',
      password_confirmation: 'doctor123'

    )
  end

  desc "Adicionando usuário para patient"  
  task add_default_patient: :environment do
    Patient.create!(
      email: 'patient@patient.com',
      password: 'patient123',
      password_confirmation: 'patient123'

    )
  end

  private

  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end

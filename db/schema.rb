# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_613_124_905) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'appointments', force: :cascade do |t|
    t.datetime 'starts_at'
    t.datetime 'ends_at'
    t.bigint 'patient_id', null: false
    t.bigint 'doctor_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['doctor_id'], name: 'index_appointments_on_doctor_id'
    t.index ['patient_id'], name: 'index_appointments_on_patient_id'
  end

  create_table 'doctors', force: :cascade do |t|
    t.string 'name'
    t.string 'crm'
    t.string 'crm_uf'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['email'], name: 'index_doctors_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_doctors_on_reset_password_token', unique: true
  end

  create_table 'patients', force: :cascade do |t|
    t.string 'name'
    t.date 'birth_date'
    t.string 'cpf'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['email'], name: 'index_patients_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_patients_on_reset_password_token', unique: true
  end

  add_foreign_key 'appointments', 'doctors'
  add_foreign_key 'appointments', 'patients'
end

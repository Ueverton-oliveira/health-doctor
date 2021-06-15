class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :starts_at, :ends_at, presence: true
end

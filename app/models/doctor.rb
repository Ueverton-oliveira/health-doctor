class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :crm, :crm_uf, presence: true

  scope :search_by, lambda { |doctor|
    where(doctor)
  }
end

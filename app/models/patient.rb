require 'date'

class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :birth_date, :cpf, presence: true

  def age(birth)
    now = Time.now.utc.to_date
    now.year - birth.year - (now.month > birth.month || (now.month == birth.month && now.day >= birth.day) ? 0 : 1)
  end
end

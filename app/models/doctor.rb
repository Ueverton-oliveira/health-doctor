class Doctor < ApplicationRecord
  validates: name, presence: true, uniqueness: { case_sensitive: false }
  validates: crm, presence: true
  validates: crm_uf, presence: true
end

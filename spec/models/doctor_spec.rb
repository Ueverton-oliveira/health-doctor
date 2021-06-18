require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:crm) }
  it { is_expected.to validate_presence_of(:crm_uf) }
end

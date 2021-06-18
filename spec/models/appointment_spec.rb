require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { is_expected.to validate_presence_of(:starts_at) }
  it { is_expected.to validate_presence_of(:ends_at) }

  it { is_expected.to belong_to :doctor }
  it { is_expected.to belong_to :patient }
end

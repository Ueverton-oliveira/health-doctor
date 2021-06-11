FactoryBot.define do
  factory :appointment do
    starts_at { "2021-06-11 15:26:34" }
    ends_at { "2021-06-11 15:26:34" }
    patient { nil }
    doctor { nil }
  end
end

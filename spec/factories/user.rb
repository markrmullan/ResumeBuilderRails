FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::String.random(9) }
  end
end

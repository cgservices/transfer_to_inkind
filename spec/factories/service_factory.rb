FactoryBot.define do

  factory :service do
    id { Faker::Number(5) }
    name { Faker::Lorem.word }
  end
end
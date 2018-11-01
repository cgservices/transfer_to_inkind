# frozen_string_literal: true

FactoryBot.define do
  factory :operator do
    id { Faker::Number(5) }
    name { Faker::Lorem.word }
    country
  end
end

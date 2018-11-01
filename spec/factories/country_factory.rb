# frozen_string_literal: true

FactoryBot.define do
  factory :country do
    id { Faker::Number(5) }
    name { Faker::Address.country }
  end
end

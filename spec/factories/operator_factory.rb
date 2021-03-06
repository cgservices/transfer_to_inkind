# frozen_string_literal: true

FactoryBot.define do
  factory :operator, class: Inkind::Entity::Operator do
    id { Faker::Number.number(5) }
    name { Faker::Lorem.word }
    country { build :country }
    initialize_with { new({}) }
  end
end

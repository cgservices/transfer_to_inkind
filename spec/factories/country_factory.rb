# frozen_string_literal: true

FactoryBot.define do
  factory :country, class: Inkind::Entity::Country do
    id { Faker::Number(5) }
    name { Faker::Address.country }
    initialize_with { new({}) }
  end
end

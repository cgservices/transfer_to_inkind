# frozen_string_literal: true

FactoryBot.define do
  factory :service, class: Inkind::Entity::Service do
    id { Faker::Number(5) }
    name { Faker::Lorem.word }
    initialize_with { new({}) }
  end
end

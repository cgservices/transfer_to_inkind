# frozen_string_literal: true

FactoryBot.define do
  factory :operator, class: 'InkindApi::Entity::Operator' do
    id { Faker::Number(5) }
    name { Faker::Lorem.word }
    country
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :country, class: 'InkindApi::Entity::Country' do
    id { Faker::Number(5) }
    name { Faker::Address.country }
  end
end

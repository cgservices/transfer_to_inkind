# frozen_string_literal: true

FactoryBot.define do
  factory :suggested_value, class: 'InkindApi::Entity::SuggestedValue' do
    local_value { Faker::Number.decimal(2) }
    local_currency { Faker::Currency.code }
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    additional_info_1 { Faker::Lorem.sentence }
    additional_info_2 { Faker::Lorem.sentence }
    additional_info_3 { Faker::Lorem.sentence }
    wholesale_price { Faker::Number.decimal(2) }
    retail_price { Faker::Number.decimal(2) }
    fee { Faker::Number.decimal(2) }
    initialize_with do
      new(
        'local_value' => local_value,
        'local_currency' => local_currency,
        'name' => name,
        'description' => description,
        'additional_info_1' => additional_info_1,
        'additional_info_2' => additional_info_2,
        'additional_info_3' => additional_info_3,
        'wholesale_price' => wholesale_price,
        'retail_price' => retail_price,
        'fee' => fee
      )
    end
  end
end

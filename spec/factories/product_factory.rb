# frozen_string_literal: true

FactoryBot.define do
  currency = Faker::Currency.code
  factory :product do
    id { Faker::Number(5) }
    name { Faker::Lorem.word }
    short_description { Faker::Lorem.sentence }
    currency { currency }
    account_currency { currency }

    operator
    country
    service
  end

  factory :fixed_value_product, parent: :product do
    value { Faker::Number.decimal(2) }
    local_value { Faker::Number.decimal(2) }
    local_currency { currency }
    wholesale_price { Faker::Number.decimal(2) }
    retail_price { Faker::Number.decimal(2) }
    fee { Faker::Number.decimal(2) }
  end

  factory :variable_value_product, parent: :product do
    suggested_values { create_list(:suggested_value, 2) }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  currency = Faker::Currency.code
  factory :product, class: InkindApi::Entity::Product do
    id { Faker::Number.number(5) }
    name { Faker::Lorem.word }
    short_description { Faker::Lorem.sentence }
    currency { currency }
    account_currency { currency }
    type { %w[voucher recharge payment].sample }

    operator { build :operator }
    country { build :country }
    service { build :service }

    initialize_with { new({}) }
  end

  factory :fixed_value_product, parent: :product, class: InkindApi::Entity::FixedValueProduct do
    value { Faker::Number.decimal(2) }
    local_value { Faker::Number.decimal(2) }
    local_currency { currency }
    wholesale_price { Faker::Number.decimal(2) }
    retail_price { Faker::Number.decimal(2) }
    fee { Faker::Number.decimal(2) }
  end

  factory :variable_value_product, parent: :product, class: InkindApi::Entity::VariableValueProduct do
    suggested_values { build_list(:suggested_value, 2) }
  end
end

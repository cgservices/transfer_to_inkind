FactoryBot.define do
  currency = Faker::Currency.code
  factory :product do

    id { Faker::Number(5) }
    name { Faker::Lorem.word }
    short_description { Faker::Lorem.sentence }
    value { Faker::Number.decimal(2) }
    currency { currency }
    local_value { Faker::Number.decimal(2) }
    local_currency { currency }
    amount_currency { currency }
    wholesale_price { Faker::Number.decimal(2) }
    retail_price { Faker::Number.decimal(2) }
    fee { Faker::Number.decimal(2) }
    operator
    country
    service
  end
end
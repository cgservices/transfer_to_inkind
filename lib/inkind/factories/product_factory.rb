# frozen_string_literal: true

module InkindApi
  module Factory
    class Product
      def self.create(type, product_data)
        case type
        when 'fixed_value_vouchers', 'fixed_value_recharges'
          product = Entity::FixedValueProduct.new product_data
        when 'variable_value_payments', 'variable_value_recharges'
          product = Entity::VariableValueProduct.new product_data
        else
          product = nil
        end
        product
      end
    end
  end
end

# frozen_string_literal: true

module InkindApi
  module Factory
    class Product
      def self.create(type, product_data, suggested_values = [])
        product_data['type'] = get_product_type(type)

        product = nil

        case type
        when 'fixed_value_vouchers', 'fixed_value_recharges'
          product = Entity::FixedValueProduct.new product_data
        when 'variable_value_payments', 'variable_value_recharges'
          product = Entity::VariableValueProduct.new(product_data, suggested_values)
        end
        product
      end

      def self.get_product_type(type)
        unless %w[fixed_value_recharges fixed_value_vouchers variable_value_recharges variable_value_payments].include?(type)
          raise StandardError.new, "This product type is not managed: #{type}"
        end

        raise "Product type not found #{type}" if type.split('_').empty?

        type.split('_').to_a[2].to_s.singularize
      end
    end
  end
end

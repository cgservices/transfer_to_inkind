# frozen_string_literal: true

module InkindApi
  module Factory
    module Entity
      class Product
        SUPPORTED_TYPES = %w[fixed_value_recharges fixed_value_vouchers variable_value_recharges].freeze

        def self.create(type, product_data, suggested_values = [])
          product_data['type'] = get_product_type(type)

          case type
          when 'fixed_value_vouchers', 'fixed_value_recharges'
            return InkindApi::Entity::FixedValueProduct.new product_data
          when 'variable_value_recharges'
            return InkindApi::Entity::VariableValueProduct.new(product_data, suggested_values)
          else
            raise StandardError.new, "Non supported product type: #{type}"
          end
        end

        def self.get_product_type(type)
          return 'recharge' if type.include?('recharge')
          return 'voucher' if type.include?('voucher')
        end

        def self.type_supported?(type)
          SUPPORTED_TYPES.include?(type)
        end
      end
    end
  end
end

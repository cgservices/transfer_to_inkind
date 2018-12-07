# frozen_string_literal: true

module InkindApi
  module Factory
    module Entity
      class Request
        def self.create(type, response_data)
          case type.to_s
          when 'fixed_value_vouchers'
            InkindApi::Entity::Request::FixedValueVoucher.new(response_data)
          when 'fixed_value_recharges'
            InkindApi::Entity::Request::FixedValueRecharge.new(response_data)
          when 'variable_value_recharges'
            InkindApi::Entity::Request::VariableValueRecharge.new(response_data)
          else
            raise StandardError.new, "Non supported request type: #{type}"
          end
        end
      end
    end
  end
end

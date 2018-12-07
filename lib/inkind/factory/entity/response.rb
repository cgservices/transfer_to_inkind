# frozen_string_literal: true

module InkindApi
  module Factory
    module Entity
      class Response
        def self.create(type, response_data)
          case type.to_s
          when 'fixed_value_vouchers'
            return InkindApi::Entity::Response::FixedValueVoucher.new(response_data)
          # when 'variable_value_recharges'
          #   return InkindApi::Entity::Response::VariableValueProduct.new(response_data)
          else
            raise StandardError.new, "Non supported response type: #{type}"
          end
        end
      end
    end
  end
end

module Inkind
  module Request
    class Transaction < Base
      def fixed_value_voucher(attributes:)
        perform_transaction(:fixed_value_vouchers, attributes)
      end

      def fixed_value_recharge(attributes:)
        perform_transaction(:fixed_value_recharges, attributes)
      end

      def variable_value_recharge(attributes:)
        perform_transaction(:variable_value_recharges, attributes)
      end

      def status(type, ext_transaction_id)
        raise StandardError, "Non supported type: #{type}" unless Inkind::Factory::Entity::Product.type_supported?(type.to_s)

        get("transactions/#{type}/ext-#{ext_transaction_id}") do |json|
          return Inkind::Factory::Entity::Response.create(type, json)
        end
      end

      private

      def perform_transaction(type, attributes)
        request = Inkind::Factory::Entity::Request.create(type, attributes)

        raise StandardError, "Invalid #{type}request parameters: #{request.meta_data}" unless request.valid?

        post("transactions/#{type}", request.body) do |json|
          return Inkind::Factory::Entity::Response.create(type, json)
        end
      end
    end
  end
end

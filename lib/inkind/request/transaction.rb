module InkindApi
  module Request
    class Transaction < Base
      def fixed_value_voucher(attributes:)
        request = InkindApi::Entity::Request::FixedValueVoucher.new(attributes)

        raise StandardError, "Invalid FixedValueVoucher request parameters: #{request.meta_data}" unless request.valid?

        post('transactions/fixed_value_vouchers', request.body) do |json|
          return InkindApi::Entity::Response::FixedValueVoucher.new(json)
        end
      end

      def status(type, ext_transaction_id)
        raise StandardError, "Non supported type: #{type}" unless InkindApi::Factory::Product.type_supported?(type.to_s)

        get("transactions/#{type}/ext-#{ext_transaction_id}") do |json|
          return InkindApi::Entity::Response::FixedValueVoucher.new(json)
        end
      end
    end
  end
end

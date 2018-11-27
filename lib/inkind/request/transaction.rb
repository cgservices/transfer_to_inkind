module InkindApi
  module Request
    class Transaction < Base
      def fixed_value_voucher(attributes:)
        request = InkindApi::Entity::Request::FixedValueVoucher.new(attributes)

        raise StandardError, "Invalid FixedValueVoucher request parameters. Data #{request.meta_data}" unless request.valid?

        post('transactions/fixed_value_vouchers', request.body) do |json|
          return InkindApi::Entity::Response::FixedValueVoucher.new(json)
        end
      end
    end
  end
end

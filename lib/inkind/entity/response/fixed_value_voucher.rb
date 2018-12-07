module InkindApi
  module Entity
    module Response
      class FixedValueVoucher < ::InkindApi::Entity::Response::Base
        attr_reader :voucher

        def initialize(parameters = {})
          super(parameters)
          attributes = filter_parameters parameters
          @product   = InkindApi::Factory::Entity::Product.create('fixed_value_vouchers', parameters)
          @voucher   = Voucher.new(attributes.fetch('voucher', {}))
        end

        def meta_data
          meta_data            = super
          meta_data['voucher'] = @voucher.meta_data
          meta_data
        end

        private

        def filter_parameters(parameters)
          parameters.slice('voucher')
        end
      end
    end
  end
end

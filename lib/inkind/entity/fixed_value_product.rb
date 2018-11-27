# frozen_string_literal: true

module InkindApi
  module Entity
    class FixedValueProduct < Product
      attr_reader :value, :local_value, :local_currency,
                  :wholesale_price, :retail_price, :fee

      def initialize(product_params)
        super(product_params)
        parameters = fixed_product_parameters product_params

        @value           = parameters['product_value']
        @local_value     = parameters['local_value']
        @local_currency  = parameters['local_currency']
        @wholesale_price = parameters['wholesale_price']
        @retail_price    = parameters['retail_price']
        @fee             = parameters['fee']
      end

      private

      def fixed_product_parameters(product_params)
        product_params.slice('product_value', 'local_value', 'local_currency',
                             'wholesale_price', 'retail_price', 'fee')
      end
    end
  end
end

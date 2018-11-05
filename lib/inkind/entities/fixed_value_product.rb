# frozen_string_literal: true

module InkindApi
  module Entity
    class FixedValueProduct < Product
      attr_accessor :value, :local_value, :local_currency,
                    :wholesale_price, :retail_price, :fee

      def initialize(product)
        super(product)
        parameters = fixed_product_parameters product

        @value             = parameters['product_value']
        @local_value       = parameters['local_value']
        @local_currency    = parameters['local_currency']
        @wholesale_price   = parameters['wholesale_price']
        @retail_price      = parameters['retail_price']
        @fee               = parameters['fee']
      end

      private

      def fixed_product_parameters(product)
        product.slice('product_value', 'local_value', 'local_currency',
                      'wholesale_price', 'retail_price', 'fee')
      end
    end
  end
end

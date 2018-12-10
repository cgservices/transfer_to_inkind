# frozen_string_literal: true

module Inkind
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
        fields = %w[product_value local_value local_currency wholesale_price retail_price fee]
        product_params.select { |k, _v| fields.include?(k) }
      end
    end
  end
end

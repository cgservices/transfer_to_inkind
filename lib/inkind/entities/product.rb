# frozen_string_literal: true

module InkindApi
  module Entity
    class Product

      attr_accessor :id, :name, :short_description, :country, :operator, :service,
                    :value, :currency, :local_value, :local_currency,
                    :account_currency, :wholesale_price, :retail_price, :fee

      def initialize(product)
        parameters = product_parameters product

        @id                = parameters['product_id']
        @name              = parameters['product_name']
        @short_description = parameters['product_short_desc']
        @value             = parameters['product_value']
        @currency          = parameters['product_currency']
        @local_value       = parameters['local_value']
        @local_currency    = parameters['local_currency']
        @account_currency  = parameters['account_currency']
        @wholesale_price   = parameters['wholesale_price']
        @retail_price      = parameters['retail_price']
        @fee               = parameters['fee']

        @operator = Operator.new(product)
        @country  = Country.new(product)
        @service  = Service.new(product)
      end

      private

      def product_parameters(product)
        product.slice('product_id', 'product_name', 'product_short_desc',
                      'operator_id', 'operator', 'country_id', 'country',
                      'service_id', 'service', 'product_value',
                      'product_currency', 'local_value', 'local_currency',
                      'account_currency', 'wholesale_price', 'retail_price',
                      'fee')
      end
    end
  end
end

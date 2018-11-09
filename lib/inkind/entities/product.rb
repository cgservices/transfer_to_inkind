# frozen_string_literal: true

module InkindApi
  module Entity
    class Product
      attr_accessor :id, :name, :short_description,
                    :country, :operator, :service,
                    :currency, :account_currency, :type

      def initialize(product)
        parameters = product_parameters product

        @id                = parameters['product_id']
        @name              = parameters['product_name']
        @short_description = parameters['product_short_desc']
        @currency          = parameters['product_currency']
        @account_currency  = parameters['account_currency']
        @type              = parameters['type']

        @operator = Operator.new(product)
        @country  = Country.new(product)
        @service  = Service.new(product)
      end

      private

      def product_parameters(product)
        product.slice('product_id', 'product_name', 'product_short_desc',
                      'operator_id', 'operator', 'country_id', 'country',
                      'service_id', 'service',
                      'product_currency', 'account_currency', 'type')
      end
    end
  end
end

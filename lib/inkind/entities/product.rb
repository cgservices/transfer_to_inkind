# frozen_string_literal: true

module InkindApi
  module Entity
    class Product < BaseEntity
      attr_reader :id, :name, :short_description,
                  :country, :operator, :service,
                  :currency, :account_currency, :type

      def initialize(product_params)
        parameters = product_parameters product_params

        @id                = parameters['product_id']
        @name              = parameters['product_name']
        @short_description = parameters['product_short_desc']
        @currency          = parameters['product_currency']
        @account_currency  = parameters['account_currency']
        @type              = parameters['type']

        @operator = Operator.new(product_params)
        @country  = Country.new(product_params)
        @service  = Service.new(product_params)
      end

      def meta_data
        meta_data             = super
        meta_data['operator'] = operator.meta_data
        meta_data['service']  = service.meta_data
        meta_data['country']  = country.meta_data
        meta_data
      end

      private

      def product_parameters(product_params)
        product_params.slice('product_id', 'product_name', 'product_short_desc',
                             'operator_id', 'operator', 'country_id', 'country',
                             'service_id', 'service',
                             'product_currency', 'account_currency', 'type')
      end
    end
  end
end

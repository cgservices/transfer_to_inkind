# frozen_string_literal: true

module InkindApi
  module Entity
    class SuggestedValue < BaseEntity
      attr_accessor :local_value,
                    :local_currency,
                    :name,
                    :description,
                    :additional_info_1,
                    :additional_info_2,
                    :additional_info_3,
                    :wholesale_price,
                    :retail_price,
                    :fee

      def initialize(suggested_value)
        parameters = suggested_value_parameters(suggested_value)

        @local_value      = parameters['local_value']
        @local_currency   = parameters['local_currency']
        @name             = parameters['name']
        @description      = parameters['description']
        @additional_info_1 = parameters['additional_info_1']
        @additional_info_2 = parameters['additional_info_2']
        @additional_info_3 = parameters['additional_info_3']
        @wholesale_price  = parameters['wholesale_price']
        @retail_price     = parameters['retail_price']
        @fee              = parameters['fee']
      end

      private

      def suggested_value_parameters(suggested_value)
        suggested_value.slice('local_value', 'local_currency',
                              'name', 'description',
                              'additional_info_1', 'additional_info_2', 'additional_info_3',
                              'wholesale_price', 'retail_price', 'fee')
      end
    end
  end
end

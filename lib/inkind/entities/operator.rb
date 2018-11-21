# frozen_string_literal: true

module InkindApi
  module Entity
    class Operator < BaseEntity
      attr_reader :id, :name, :country

      def initialize(operator_params)
        parameters = operator_parameters operator_params

        @id      = parameters['operator_id']
        @name    = parameters['operator']
        @country = Country.new(operator_params)
      end

      def meta_data
        meta_data            = super
        meta_data['country'] = country.meta_data
        meta_data
      end

      private

      def operator_parameters(operator_params)
        operator_params.slice('operator_id', 'operator')
      end
    end
  end
end

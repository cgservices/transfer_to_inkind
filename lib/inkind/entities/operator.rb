# frozen_string_literal: true

module InkindApi
  module Entity
    class Operator
      attr_accessor :id, :name, :country

      def initialize(operator)
        parameters = operator_parameters operator

        @id      = parameters['operator_id']
        @name    = parameters['operator']
        @country = Country.new(operator)
      end

      private

      def operator_parameters(parameters)
        parameters.slice('operator_id', 'operator')
      end
    end
  end
end

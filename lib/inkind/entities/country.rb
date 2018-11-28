# frozen_string_literal: true

module InkindApi
  module Entity
    class Country < Base
      attr_reader :id, :name

      def initialize(country_params)
        parameters = country_parameters country_params

        @id   = parameters['country_id']
        @name = parameters['country']
      end

      private

      def country_parameters(country_params)
        country_params.slice('country_id', 'country')
      end
    end
  end
end

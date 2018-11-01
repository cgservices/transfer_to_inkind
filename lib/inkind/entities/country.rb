# frozen_string_literal: true

module InkindApi
  module Entity
    class Country
      attr_accessor :id, :name

      def initialize(country)
        parameters = country_parameters country

        @id   = parameters['country_id']
        @name = parameters['country']
      end

      private

      def country_parameters(country)
        country.slice('country_id', 'country')
      end
    end
  end
end

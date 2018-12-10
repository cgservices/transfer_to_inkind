# frozen_string_literal: true

module Inkind
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
        fields = %w[country_id country]
        country_params.select { |k, _v| fields.include?(k) }
      end
    end
  end
end

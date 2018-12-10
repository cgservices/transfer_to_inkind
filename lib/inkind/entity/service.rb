# frozen_string_literal: true

module InkindApi
  module Entity
    class Service < Base
      attr_reader :id, :name

      def initialize(service_params)
        parameters = service_parameters service_params

        @id   = parameters['service_id']
        @name = parameters['service']
      end

      private

      def service_parameters(service_params)
        fields = %w[service_id service]
        service_params.select { |k, _v| fields.include?(k) }
      end
    end
  end
end

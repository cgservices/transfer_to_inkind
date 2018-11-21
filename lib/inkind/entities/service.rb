# frozen_string_literal: true

module InkindApi
  module Entity
    class Service < BaseEntity
      attr_reader :id, :name

      def initialize(service_params)
        parameters = service_parameters service_params

        @id   = parameters['service_id']
        @name = parameters['service']
      end

      private

      def service_parameters(service_params)
        service_params.slice('service_id', 'service')
      end
    end
  end
end

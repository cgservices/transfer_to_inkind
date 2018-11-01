# frozen_string_literal: true

module InkindApi
  module Entity
    class Service
      attr_accessor :id, :name

      def initialize(service)
        parameters = service_parameters service

        @id   = parameters['service_id']
        @name = parameters['service']
      end

      private

      def service_parameters(service)
        service.slice('service_id', 'service')
      end
    end
  end
end

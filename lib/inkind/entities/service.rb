# frozen_string_literal: true

module InkindApi
  module Entity
    class Service
      attr_accessor :id, :name

      def initialize(service)
        @id = service['service_id']
        @name = service['service']
      end
    end
  end
end

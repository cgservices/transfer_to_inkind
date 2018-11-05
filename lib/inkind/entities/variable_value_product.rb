# frozen_string_literal: true

module InkindApi
  module Entity
    class VariableValueProduct < Product
      attr_accessor :suggested_values

      def initialize(product, suggested_values = [])
        super(product)
        @suggested_values = suggested_values
      end
    end
  end
end

# frozen_string_literal: true

module InkindApi
  module Entity
    class VariableValueProduct < Product
      attr_accessor :suggested_values

      def initialize(product, suggested_values = [])
        super(product)
        @suggested_values = suggested_values
      end

      def min(criterion)
        min_suggested_value_by(criterion).public_send(criterion)
      end

      def max(criterion)
        max_suggested_value_by(criterion).public_send(criterion)
      end

      def min_suggested_value_by(criterion)
        @suggested_values.min_by(&criterion)
      end

      def max_suggested_value_by(criterion)
        @suggested_values.max_by(&criterion)
      end
    end
  end
end

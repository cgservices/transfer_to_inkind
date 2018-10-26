# frozen_string_literal: true

module InkindApi
  module Entity
    class Operator
      attr_accessor :id, :name, :country

      def initialize(operator)
        @id = operator['operator_id']
        @name = operator['operator']
        @country = Country.new(
          country_id: operator['country_id'],
          country: operator['country']
        )
      end
    end
  end
end

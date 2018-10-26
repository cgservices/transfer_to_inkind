# frozen_string_literal: true

module InkindApi
  module Entity
    class Product
      attr_accessor :id, :name

      def initialize(product)
        @id = product['product_id']
        @name = product['product_name']
      end
    end
  end
end

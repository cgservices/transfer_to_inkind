module InkindApi
  module Entity
    class Product

      attr_accessor :id, :name

      def initialize(product)
        @id = product['product_id']
        @name = product['product']
      end
    end
  end
end

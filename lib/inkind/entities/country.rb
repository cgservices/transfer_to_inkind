module InkindApi
  module Entity
    class Country
      attr_accessor :id, :name

      def initialize(country)
        @id = country['country_id']
        @name = country['country']
      end
    end
  end
end

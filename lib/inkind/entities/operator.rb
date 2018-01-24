module InkindApi
  module Entity
    class Operator

      attr_accessor :id, :name, :country

      def initialize(operator)
        @id = operator['service_id']
        @name = operator['service']
        @country = Country.new(
          country_id: operator['country_id'],
          country: operator['country']
        )
      end
    end
  end
end

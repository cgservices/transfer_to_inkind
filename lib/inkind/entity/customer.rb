module Inkind
  module Entity
    class Customer < Base
      attr_reader :last_name, :middle_name, :first_name, :email, :mobile

      def initialize(args = {})
        @last_name   = args['last_name']
        @middle_name = args['middle_name']
        @first_name  = args['first_name']
        @email       = args['email']
        @mobile      = args['mobile']
      end

      def valid?
        (!mobile.nil? && !mobile.empty?)
      end
    end
  end
end

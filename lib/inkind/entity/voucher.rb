module InkindApi
  module Entity
    class Voucher < Base
      attr_accessor :pin, :pin2, :currency, :value, :expiration_date, :info_1, :info_2, :info_3

      def initialize(parameters)
        attributes = filter_parameters parameters

        @pin             = attributes['pin']
        @pin2            = attributes['pin2']
        @currency        = attributes['currency']
        @value           = attributes['value']
        @expiration_date = attributes['expiration_date']
        @info_1          = attributes['info_1']
        @info_2          = attributes['info_2']
        @info_3          = attributes['info_3']
      end

      def filter_parameters(parameters)
        parameters.slice('pin', 'pin2', 'currency', 'value', 'expiration_date', 'info_1', 'info_2', 'info_3')
      end
    end
  end
end

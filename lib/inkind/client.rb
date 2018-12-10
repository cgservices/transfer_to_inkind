# frozen_string_literal: true

module Inkind
  class Client
    def initialize(config:)
      @config = config
    end

    def ping?
      request(:discovery).ping?
    end

    def services
      request(:discovery).services
    end

    def countries
      request(:discovery).countries
    end

    def operators
      request(:discovery).operators
    end

    def products(operator_id: nil)
      request(:discovery).products(operator_id: operator_id)
    end

    def fixed_value_voucher(parameters)
      request(:transaction).fixed_value_voucher(attributes: parameters)
    end

    def fixed_value_recharge(parameters)
      request(:transaction).fixed_value_recharge(attributes: parameters)
    end

    def variable_value_recharge(parameters)
      request(:transaction).variable_value_recharge(attributes: parameters)
    end

    def transaction_status(type, ext_transaction_id)
      request(:transaction).status(type, ext_transaction_id)
    end

    private

    def request(type)
      Inkind::Factory::Request.create(type, @config)
    end
  end
end

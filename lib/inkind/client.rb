# frozen_string_literal: true

module InkindApi
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

    private

    def request(type)
      InkindApi::Factory::Request.create(type, @config)
    end
  end
end

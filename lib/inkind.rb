# frozen_string_literal: true

require 'faraday'
require 'net/http'
require 'openssl'
require 'base64'
require 'json'

module Inkind
  class Config
    attr_writer :base_url,
                :api_key,
                :api_secret

    def base_url
      @base_url || ENV['TRANSFER_TO_INKIND_ENDPOINT']
    end

    def api_key
      @api_key || ENV['TRANSFER_TO_INKIND_API_KEY']
    end

    def api_secret
      @api_secret || ENV['TRANSFER_TO_INKIND_API_SECRET']
    end
  end
end

require 'inkind/version'
require 'inkind/exception/connection_exception'
require 'inkind/exception/response_exception'
require 'inkind/client'
require 'inkind/request/base'
require 'inkind/request/discovery'
require 'inkind/request/transaction'
require 'inkind/factory/entity/product'
require 'inkind/factory/entity/response'
require 'inkind/factory/entity/request'
require 'inkind/factory/request'
require 'inkind/factory/exception'
require 'inkind/entity/base'
require 'inkind/entity/request/base'
require 'inkind/entity/request/fixed_value_voucher'
require 'inkind/entity/request/fixed_value_recharge'
require 'inkind/entity/request/variable_value_recharge'
require 'inkind/entity/response/base'
require 'inkind/entity/response/fixed_value_voucher'
require 'inkind/entity/response/fixed_value_recharge'
require 'inkind/entity/response/variable_value_recharge'
require 'inkind/entity/service'
require 'inkind/entity/voucher'
require 'inkind/entity/customer'
require 'inkind/entity/country'
require 'inkind/entity/operator'
require 'inkind/entity/product'
require 'inkind/entity/suggested_value'
require 'inkind/entity/fixed_value_product'
require 'inkind/entity/variable_value_product'

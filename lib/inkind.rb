# frozen_string_literal: true

require 'faraday'
require 'net/http'
require 'openssl'
require 'base64'
require 'json'

module InkindApi
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
require 'inkind/exception'
require 'inkind/client'
require 'inkind/factories/product_factory'
require 'inkind/entities/base'
require 'inkind/entities/service'
require 'inkind/entities/country'
require 'inkind/entities/operator'
require 'inkind/entities/product'
require 'inkind/entities/suggested_value'
require 'inkind/entities/fixed_value_product'
require 'inkind/entities/variable_value_product'
require 'inkind/entities/product'

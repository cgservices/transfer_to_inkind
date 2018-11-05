# frozen_string_literal: true

require 'faraday'
require 'net/http'
require 'openssl'
require 'base64'

require 'inkind/version'
require 'inkind/exception'
require 'inkind/client'
require 'inkind/factories/product_factory'
require 'inkind/entities/service'
require 'inkind/entities/country'
require 'inkind/entities/operator'
require 'inkind/entities/product'
require 'inkind/entities/suggested_value'
require 'inkind/entities/fixed_value_product'
require 'inkind/entities/variable_value_product'
require 'inkind/entities/product'

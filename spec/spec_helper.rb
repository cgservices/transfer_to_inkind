# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'
SimpleCov.start

# Set load path
$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'inkind'
require 'pry'
require 'yaml'
require 'vcr'
require 'factory_bot'
require 'faker'

CLIENT = InkindApi::Client.new

VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures'
  config.hook_into :webmock
  config.filter_sensitive_data('') do |i|
    i.request.headers.reject! do |key|
      %w[X-Transferto-Apikey X-Transferto-Nonce X-Transferto-Hmac].include? key
    end
  end
end

# Configure RSpec
RSpec.configure do |config|
  config.color     = true
  config.fail_fast = ENV['FAIL_FAST'] || false
  config.order     = 'random'

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end

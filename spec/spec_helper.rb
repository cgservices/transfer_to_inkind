ENV['RAILS_ENV'] ||= 'test'

# Set load path
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'inkind'
require 'pry'
require 'yaml'
require 'vcr'

require 'simplecov'
SimpleCov.start

CONFIG = YAML.load(File.open('./config.yml'))
CLIENT = InkindApi::Client.new(CONFIG)

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures"
  config.hook_into :webmock
  config.filter_sensitive_data('') do |i|
    i.request.headers.reject! do |key|
      ['X-Transferto-Apikey', 'X-Transferto-Nonce', 'X-Transferto-Hmac'].include? key
    end
  end
end

# Configure RSpec
RSpec.configure do |config|
  config.color = true
  config.fail_fast = ENV['FAIL_FAST'] || false
  config.order = 'random'
end

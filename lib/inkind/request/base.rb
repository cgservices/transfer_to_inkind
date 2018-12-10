module Inkind
  module Request
    class Base
      def initialize(config:)
        @config ||= config
      end

      protected

      attr_accessor :config

      def get(url, parameters = {})
        conn     = Faraday.new(url: config.base_url)
        # IMPROVE: Should catch a ConnectionError if failing
        response = conn.get(url, parameters, get_headers)
        json     = JSON.parse(response.body)
        capture_error json
        yield json
      end

      def post(url, parameters)
        conn     = Faraday.new(url: config.base_url)
        # IMPROVE: Should catch a ConnectionError if failing
        response = conn.post(url, parameters, post_headers)
        json     = JSON.parse(response.body)
        capture_error json
        yield json
      end

      def get_headers
        authentication_headers
      end

      def post_headers
        authentication_headers.merge('Content-Type' => 'application/json')
      end

      def authentication_headers
        nonce = (Time.now.to_f * 1000).to_s
        {
          'X-TransferTo-Nonce' => nonce,
          'X-TransferTo-Hmac' => calculate_hmac(nonce),
          'X-TransferTo-Apikey' => config.api_key
        }
      end

      def calculate_hmac(nonce)
        Base64.encode64(OpenSSL::HMAC.digest('sha256', config.api_secret, [config.api_key, nonce].join))
      end

      def capture_error(json)
        ResponseException.new(json['errors'][0]['code'], json['errors'][0]['message'], json) if json['errors']
      end
    end
  end
end

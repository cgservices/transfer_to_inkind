module Inkind
  module Request
    class Base

      OPEN_TIMEOUT = 5
      READ_TIMEOUT = 30

      def initialize(config:)
        @config ||= config
        @conn   = Faraday.new(url: config.base_url) do |c|
          c.adapter :net_http do |http|
            http.open_timeout = OPEN_TIMEOUT
            http.read_timeout = READ_TIMEOUT
          end
        end
      end

      protected

      attr_accessor :config, :conn

      def get(url, parameters = {})
        begin
          response = conn.get(url, parameters, get_headers)
        rescue Faraday::TimeoutError => e # Used for read_timeout
          raise Inkind::Exception::TimeoutException.new(e.message)
        rescue => e # Used for open_timeout (Faraday::ConnectionFailed), and friends
          raise Inkind::Exception::ConnectionException.new(e.message)
        end

        json = JSON.parse(response.body)
        capture_error json
        yield json
      end

      def post(url, parameters)
        begin
          response = conn.post(url, parameters, post_headers)
        rescue Faraday::TimeoutError => e # Used for read_timeout
          raise Inkind::Exception::TimeoutException.new(e.message)
        rescue => e # Used for open_timeout (Faraday::ConnectionFailed), and friends
          raise Inkind::Exception::ConnectionException.new(e.message)
        end
        json = JSON.parse(response.body)
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
          'X-TransferTo-Nonce'  => nonce,
          'X-TransferTo-Hmac'   => calculate_hmac(nonce),
          'X-TransferTo-Apikey' => config.api_key
        }
      end

      def calculate_hmac(nonce)
        Base64.encode64(OpenSSL::HMAC.digest('sha256', config.api_secret, [config.api_key, nonce].join))
      end

      def capture_error(json)
        return unless json['errors']

        raise Inkind::Factory::Exception.create(json['errors'][0]['code'], json['errors'][0]['message'], json)
      end
    end
  end
end

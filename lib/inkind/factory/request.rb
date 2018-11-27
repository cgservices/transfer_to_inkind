module InkindApi
  module Factory
    class Request
      def self.create(type, config)
        case type
        when :discovery
          InkindApi::Request::Discovery.new(config: config)
        when :transaction
          InkindApi::Request::Transaction.new(config: config)
        else
          raise StandardError.new, "Client type non managed:#{type}"
        end
      end
    end
  end
end

module InkindApi
  # Client class for InKind TransferTo API
  class Client

    def initialize(config)
      @config ||= config
    end

    def ping?
      get 'ping' do |json|
        return json['status'] == 'up'
      end
    end

    def services
      services = []
      get 'services' do |json|
        json['services'].each do |service|
          services << Entity::Service.new(service)
        end
      end
      services
    end

    def countries
      countries = []
      get 'countries' do |json|
        json['countries'].each do |country|
          countries << Entity::Country.new(country)
        end
      end
      countries
    end

    def operators
      operators = []
      get 'operators' do |json|
        json['operators'].each do |operator|
          operators << Entity::Operator.new(operator)
        end
      end
      operators
    end

    def products(operator_id = nil)
      products = []
      operators.each do |operator|
        get "operators/#{operator.id}/products" do |json|
          json['products'].each do |product|
            products << Entity::Product.new(product, operator)
          end
        end
      end
      products
    end

    private

    def get(url)
      conn = Faraday.new(url: @config['endpoint'])
      response = conn.get url do |req|
        req.headers['X-TransferTo-Apikey'] = @config['api_key']
        req.headers['X-TransferTo-Nonce'] = (Time.now.to_f * 1000).to_s
        req.headers['X-TransferTo-Hmac'] = calculate_hmac(req.headers['X-TransferTo-Nonce'])
      end
      json = JSON.parse(response.body)
      capture_error json
      yield json
    rescue => e
      p e
    end

    def calculate_hmac(nonce)
      Base64.encode64(
        OpenSSL::HMAC.digest(
          'sha256',
          @config['api_secret'],
          [@config['api_key'], nonce].join
        )
      )
    end

    def capture_error(json)
      raise "An error occurred [#{json['errors'][0]['code']}]: #{json['errors'][0]['message']}" if json['errors']
    end

  end
end

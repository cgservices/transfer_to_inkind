# frozen_string_literal: true

module InkindApi
  # Client class for InKind TransferTo API
  class Client
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
      if operator_id.nil?
        operators.each do |operator|
          products += get_products_per_operator operator.id
        end
      else
        products += get_products_per_operator operator_id
      end
      products
    end

    private

    def get(url)
      conn     = Faraday.new(url: ENV['TRANSFER_TO_INKIND_ENDPOINT'])
      response = conn.get url do |req|
        req.headers['X-TransferTo-Apikey'] = ENV['TRANSFER_TO_INKIND_API_KEY']
        req.headers['X-TransferTo-Nonce']  = (Time.now.to_f * 1000).to_s
        req.headers['X-TransferTo-Hmac']   = calculate_hmac(req.headers['X-TransferTo-Nonce'])
      end
      json = JSON.parse(response.body)
      capture_error json
      yield json
    rescue StandardError => e
      p e
    end

    def calculate_hmac(nonce)
      Base64.encode64(
        OpenSSL::HMAC.digest(
          'sha256',
          ENV['TRANSFER_TO_INKIND_API_SECRET'],
          [ENV['TRANSFER_TO_INKIND_API_KEY'], nonce].join
        )
      )
    end

    def capture_error(json)
      raise "An error occurred [#{json['errors'][0]['code']}]: #{json['errors'][0]['message']}" if json['errors']
    end

    def get_products_per_operator(operator_id)
      products      = []
      product_types = %w[fixed_value_recharges fixed_value_vouchers variable_value_recharges variable_value_payments]
      get "operators/#{operator_id}/products" do |json|
        product_types.each do |product_type|
          json[product_type].each do |product|
            products << Factory::Product.create(product_type, product)
          end
        end
      end
      products
    end
  end
end

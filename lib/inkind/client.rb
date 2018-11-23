# frozen_string_literal: true

module InkindApi
  class Client
    def initialize(config:)
      @config = config
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
      if operator_id.nil?
        operators.each do |operator|
          products += products_per_operator operator.id
        end
      else
        products += products_per_operator operator_id
      end
      products
    end

    private

    def get(url)
      conn     = Faraday.new(url: @config.base_url)
      response = conn.get url do |req|
        req.headers['X-TransferTo-Nonce']  = (Time.now.to_f * 1000).to_s
        req.headers['X-TransferTo-Hmac']   = calculate_hmac(req.headers['X-TransferTo-Nonce'])
        req.headers['X-TransferTo-Apikey'] = @config.api_key
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
          @config.api_secret,
          [@config.api_key, nonce].join
        )
      )
    end

    def capture_error(json)
      raise "An error occurred [#{json['errors'][0]['code']}]: #{json['errors'][0]['message']}" if json['errors']
    end

    def products_per_operator(operator_id)
      products = []
      # TODO: Re-add the variable_value_payment type
      product_types = %w[fixed_value_recharges fixed_value_vouchers variable_value_recharges]
      get "operators/#{operator_id}/products" do |json|
        product_types.each do |product_type|
          json[product_type].each do |product|
            suggested_values = product_type == 'variable_value_recharges' ? suggested_values(product['product_id']) : nil
            products << Factory::Product.create(product_type, product, suggested_values)
          end
        end
      end
      products
    end

    def suggested_values(product_id)
      suggested_values = []
      get "product/variable_value_recharges/#{product_id}/suggested_values" do |json|
        json['suggested_values'].each do |suggested_value|
          suggested_values << Entity::SuggestedValue.new(suggested_value)
        end
      end
      suggested_values
    end
  end
end

module InkindApi
  module Request
    class Discovery < Base
      def ping?
        get 'ping' do |json|
          return json['status'] == 'up'
        end
      end

      def services
        get 'services' do |json|
          json['services'].map { |service| Entity::Service.new(service) }
        end
      end

      def countries
        get 'countries' do |json|
          json['countries'].map { |country| Entity::Country.new(country) }
        end
      end

      def operators
        get 'operators' do |json|
          json['operators'].map { |operator| Entity::Operator.new(operator) }
        end
      end

      def products(operator_id: nil)
        return products_per_operator operator_id unless operator_id.nil?

        operators.flat_map { |operator| products(operator_id: operator.id) }
      end

      private

      def products_per_operator(operator_id)
        # TODO: Re-add the variable_value_payment type
        product_types = %w[fixed_value_recharges fixed_value_vouchers variable_value_recharges]
        get "operators/#{operator_id}/products" do |json|
          product_types.flat_map do |product_type|
            json[product_type].map do |product|
              suggested_values = product_type == 'variable_value_recharges' ? suggested_values(product['product_id']) : nil
              Factory::Product.create(product_type, product, suggested_values)
            end
          end
        end
      end

      def suggested_values(product_id)
        get "product/variable_value_recharges/#{product_id}/suggested_values" do |json|
          json['suggested_values'].map { |suggested_value| Entity::SuggestedValue.new(suggested_value) }
        end
      end
    end
  end
end

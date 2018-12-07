module InkindApi
  module Entity
    module Response
      class FixedValueRecharge < ::InkindApi::Entity::Response::Base
        def initialize(parameters = {})
          super(parameters)
          @product = InkindApi::Factory::Entity::Product.create('fixed_value_recharges', parameters)
        end
      end
    end
  end
end

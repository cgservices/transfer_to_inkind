module Inkind
  module Entity
    module Response
      class FixedValueRecharge < ::Inkind::Entity::Response::Base
        def initialize(parameters = {})
          super(parameters)
          @product = Inkind::Factory::Entity::Product.create('fixed_value_recharges', parameters)
        end
      end
    end
  end
end

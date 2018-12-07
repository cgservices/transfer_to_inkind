module InkindApi
  module Entity
    module Response
      class VariableValueRecharge < ::InkindApi::Entity::Response::Base
        attr_reader :local_value

        def initialize(parameters = {})
          super(parameters)
          attributes = filter_parameters(parameters)

          @product     = InkindApi::Factory::Entity::Product.create('variable_value_recharges', parameters)
          @local_value = attributes['local_value']
        end

        def filter_parameters(parameters)
          parameters.slice('local_value')
        end
      end
    end
  end
end

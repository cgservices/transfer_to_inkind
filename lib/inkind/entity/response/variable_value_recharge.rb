module Inkind
  module Entity
    module Response
      class VariableValueRecharge < ::Inkind::Entity::Response::Base
        attr_reader :local_value

        def initialize(parameters = {})
          super(parameters)
          attributes = filter_parameters(parameters)

          @product     = Inkind::Factory::Entity::Product.create('variable_value_recharges', parameters)
          @local_value = attributes['local_value']
        end

        def filter_parameters(parameters)
          fields = %w(local_value)
          parameters.select { |k, _v| fields.include?(k) }
        end
      end
    end
  end
end

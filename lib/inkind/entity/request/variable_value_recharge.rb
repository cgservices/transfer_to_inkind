module Inkind
  module Entity
    module Request
      class VariableValueRecharge < ::Inkind::Entity::Request::Base
        attr_reader :local_value

        def initialize(parameters)
          super(parameters)

          attributes   = filter_parameters parameters
          @local_value = attributes['local_value']
        end

        def mandatory_fields
          super.push('local_value')
        end

        def filter_parameters(parameters)
          fields = %w(local_value)
          parameters.select { |k, _v| fields.include?(k) }
        end
      end
    end
  end
end

# frozen_string_literal: true

module InkindApi
  module Entity
    class BaseEntity
      def meta_data
        hash = {}
        instance_variables.each { |var| hash[var.to_s.delete('@')] = instance_variable_get(var) }
        hash
      end
    end
  end
end

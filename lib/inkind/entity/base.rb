# frozen_string_literal: true

module Inkind
  module Entity
    class Base
      def meta_data
        instance_variables.map { |var| [var.to_s.delete('@'), instance_variable_get(var)] }.to_h
      end
    end
  end
end

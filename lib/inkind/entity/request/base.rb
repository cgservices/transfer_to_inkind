module InkindApi
  module Entity
    module Request
      class Base < ::InkindApi::Entity::Base
        attr_reader :account_number, :product_id, :external_id, :simulation,
                    :sender, :recipient, :sender_sms_notification, :sender_sms_text,
                    :recipient_sms_notification, :recipient_sms_text

        def initialize(parameters)
          attributes = filter_base_parameters parameters

          @account_number             = attributes['account_number']
          @product_id                 = attributes['product_id']
          @external_id                = attributes['external_id']
          @simulation                 = attributes['simulation']
          @sender_sms_notification    = attributes['sender_sms_notification']
          @sender_sms_text            = attributes['sender_sms_text']
          @recipient_sms_notification = attributes['recipient_sms_notification']
          @recipient_sms_text         = attributes['recipient_sms_text']
          @sender                     = Customer.new(attributes.fetch('sender', {}))
          @recipient                  = Customer.new(attributes.fetch('recipient', {}))
        end

        def valid?
          return false if missing_mandatory_fields?
          return false unless sender.valid?
          return false unless recipient.valid?

          true
        end

        def meta_data
          meta_data              = super
          meta_data['sender']    = sender.meta_data
          meta_data['recipient'] = recipient.meta_data
          meta_data
        end

        def body
          meta_data.to_json
        end

        private

        def missing_mandatory_fields?
          mandatory_fields = %w[account_number product_id external_id]
          mandatory_fields.each do |mandatory_field|
            instance_variable = '@' + mandatory_field
            return true if instance_variable_defined?(instance_variable) && instance_variable_get(instance_variable).blank?
          end
          false
        end

        def filter_base_parameters(parameters)
          parameters.slice('account_number', 'product_id', 'external_id', 'simulation', 'sender_sms_notification',
                           'sender_sms_text', 'recipient_sms_notification', 'recipient_sms_text', 'sender', 'recipient')
        end
      end
    end
  end
end

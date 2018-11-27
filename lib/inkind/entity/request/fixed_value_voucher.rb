module InkindApi
  module Entity
    module Request
      class FixedValueVoucher < ::InkindApi::Entity::Base
        attr_reader :account_number, :product_id, :external_id, :simulation,
                    :sender, :recipient, :sender_sms_notification, :sender_sms_text,
                    :recipient_sms_notification, :recipient_sms_text

        def initialize(parameters)
          parameters = fixed_value_voucher_params parameters

          @account_number             = parameters['account_number']
          @product_id                 = parameters['product_id']
          @external_id                = parameters['external_id']
          @simulation                 = parameters['simulation']
          @sender_sms_notification    = parameters['sender_sms_notification']
          @sender_sms_text            = parameters['sender_sms_text']
          @recipient_sms_notification = parameters['recipient_sms_notification']
          @recipient_sms_text         = parameters['recipient_sms_text']
          @sender                     = Customer.new(parameters['sender'])
          @recipient                  = Customer.new(parameters['recipient'])
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

        def fixed_value_voucher_params(parameters)
          parameters.slice('account_number', 'product_id', 'external_id', 'simulation', 'sender_sms_notification',
                           'sender_sms_text', 'recipient_sms_notification', 'recipient_sms_text', 'sender', 'recipient')
        end
      end
    end
  end
end

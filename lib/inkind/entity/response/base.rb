module Inkind
  module Entity
    module Response
      class Base < ::Inkind::Entity::Base
        attr_reader :transaction_id, :simulation, :status, :status_message, :date, :account_number, :external_id,
                    :operator_reference, :product, :sender, :recipient, :sender_sms_notification, :sender_sms_text,
                    :recipient_sms_notification, :recipient_sms_text

        def initialize(parameters = {})
          attributes = filter_base_parameters parameters

          @simulation                 = attributes['simulation']
          @account_number             = attributes['account_number']
          @external_id                = attributes['external_id']
          @transaction_id             = attributes['transaction_id']
          @status                     = attributes['status']
          @status_message             = attributes['status_message']
          @date                       = attributes['date']
          @operator_reference         = attributes['operator_reference']
          @sender_sms_notification    = attributes['sender_sms_notification']
          @sender_sms_text            = attributes['sender_sms_text']
          @recipient_sms_notification = attributes['recipient_sms_notification']
          @recipient_sms_text         = attributes['recipient_sms_text']
          @sender                     = Customer.new(attributes.fetch('sender', {}))
          @recipient                  = Customer.new(attributes.fetch('recipient', {}))
        end

        def meta_data
          meta_data              = super
          meta_data['product']   = @product.meta_data
          meta_data['sender']    = @sender.meta_data
          meta_data['recipient'] = @recipient.meta_data
          meta_data
        end

        private

        def filter_base_parameters(parameters)
          parameters.slice('account_number', 'external_id', 'simulation', 'sender_sms_notification',
                           'sender_sms_text', 'recipient_sms_notification', 'recipient_sms_text', 'sender', 'recipient',
                           'status', 'status_message', 'date', 'product', 'transaction_id', 'operator_reference')
        end
      end
    end
  end
end

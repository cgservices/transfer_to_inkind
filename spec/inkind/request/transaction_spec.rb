describe Inkind::Request::Transaction do
  subject { described_class.new(config: Inkind::Config.new) }

  describe '#fixed_value_voucher' do
    context 'with valid data' do
      let(:valid_parameters) { { 'account_number' => '6281234567890', 'product_id' => '112', 'external_id' => '14248512386098429', 'simulation' => '1', 'sender_sms_notification' => '1', 'sender_sms_text' => 'Sender message', 'recipient_sms_notification' => '1', 'recipient_sms_text' => 'Recipient message', 'sender' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'John', 'email' => 'john@testaccount.com', 'mobile' => '6012345678' }, 'recipient' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'Lisa', 'email' => 'lisa@testaccount.com', 'mobile' => '6281234567890' } } }

      it 'returns a FixedValueVoucher response' do
        expect(Inkind::Entity::Response::FixedValueVoucher)
          .to receive(:new)
                .at_least(:once)
                .and_call_original

        VCR.use_cassette('fixed_value_vouchers') do
          expect(subject.fixed_value_voucher(attributes: valid_parameters)).to be_a Inkind::Entity::Response::FixedValueVoucher
        end
      end
    end
  end

  describe '#status' do
    context 'with an unknown transaction' do
      it 'should raise a Inkind::Exception::TransactionNotFound' do
        VCR.use_cassette('fixed_value_vouchers') do
          expect { subject.status(:fixed_value_vouchers, 1337) }.to raise_exception Inkind::Exception::TransactionNotFound
        end
      end
    end

    context 'with an existing fixed_value_voucher transaction' do
      let(:fixed_value_vouchers_api_response) { OpenStruct.new(body: '{ "transaction_id": "1778", "simulation": 0, "status": "0", "status_message": "Transaction successful", "date": "2015-02-25 09:20:50", "account_number": "6281234567890", "external_id": "1234567890", "operator_reference": "", "product_id": "1", "product": "Voucher IDR 20000", "product_value": 20000, "product_currency": "IDR", "local_value": 20000, "local_currency": "IDR", "operator_id": "1988", "operator": "Indomaret VBE Indonesia", "country_id": "767", "country": "Indonesia", "account_currency": "USD", "wholesale_price": 2.55, "retail_price": 3, "fee": 0, "sender": { "last_name": "Delorm", "middle_name": "", "first_name": "John", "email": "john@testaccount.com", "mobile": "6012345678", "custom_field_1": "", "custom_field_2": "", "custom_field_3": "" }, "recipient": { "last_name": "Delorm", "middle_name": "", "first_name": "Lisa", "email": "lisa@testaccount.com", "mobile": "6281234567890", "custom_field_1": "", "custom_field_2": "", "custom_field_3": "" }, "sender_sms_notification": 1, "sender_sms_text": "Sender message", "recipient_sms_notification": 1, "recipient_sms_text": "Recipient message", "custom_field_1": "", "custom_field_2": "", "custom_field_3": "", "voucher": { "pin": "1111 2222 3333 4444", "pin2": "", "currency": "IDR", "value": "20000", "expiration_date": "2015-05-01", "info_1": "", "info_2": "", "info_3": "" } }') }
      it 'should return a FixedValueVoucher response' do
        allow_any_instance_of(Faraday::Connection).to receive(:get).and_return(fixed_value_vouchers_api_response)
        expect(subject.status(:fixed_value_vouchers, 1234567890)).to be_a Inkind::Entity::Response::FixedValueVoucher
      end

    end
  end

  describe '#fixed_value_recharge' do
    context 'with valid data' do
      let(:valid_parameters) { { 'account_number' => '6281234567890', 'product_id' => '315', 'external_id' => '14248512386098429', 'simulation' => '1', 'sender_sms_notification' => '1', 'sender_sms_text' => 'Sender message', 'recipient_sms_notification' => '1', 'recipient_sms_text' => 'Recipient message', 'sender' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'John', 'email' => 'john@testaccount.com', 'mobile' => '6012345678' }, 'recipient' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'Lisa', 'email' => 'lisa@testaccount.com', 'mobile' => '6281234567890' } } }

      it 'returns a FixedValueRecharge response' do
        expect(Inkind::Entity::Response::FixedValueRecharge)
          .to receive(:new)
                .at_least(:once)
                .and_call_original

        VCR.use_cassette('fixed_value_recharges') do
          expect(subject.fixed_value_recharge(attributes: valid_parameters)).to be_a Inkind::Entity::Response::FixedValueRecharge
        end
      end
    end
  end

  describe '#variable_value_recharge' do
    context 'with valid data' do
      let(:valid_parameters) { { 'account_number' => '911234567890', 'product_id' => '1558', 'external_id' => '14248512386098431', 'local_value' => '29', 'simulation' => '1', 'sender_sms_notification' => '1', 'sender_sms_text' => 'Sender message', 'recipient_sms_notification' => '1', 'recipient_sms_text' => 'Recipient message', 'sender' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'John', 'email' => 'john@testaccount.com', 'mobile' => '6012345678' }, 'recipient' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'Lisa', 'email' => 'lisa@testaccount.com', 'mobile' => '911234567890' } } }

      it 'returns a VariableValueRecharge response' do
        expect(Inkind::Entity::Response::VariableValueRecharge)
          .to receive(:new)
                .at_least(:once)
                .and_call_original

        VCR.use_cassette('variable_value_recharges') do
          expect(subject.variable_value_recharge(attributes: valid_parameters)).to be_a Inkind::Entity::Response::VariableValueRecharge
        end
      end
    end
  end
end

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

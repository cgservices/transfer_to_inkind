describe InkindApi::Request::Transaction do
  subject { described_class.new(config: InkindApi::Config.new) }

  describe '#fixed_value_voucher' do
    context 'with valid data' do
      let(:valid_parameters) { { 'account_number' => '6281234567890', 'product_id' => '112', 'external_id' => '14248512386098429', 'simulation' => '1', 'sender_sms_notification' => '1', 'sender_sms_text' => 'Sender message', 'recipient_sms_notification' => '1', 'recipient_sms_text' => 'Recipient message', 'sender' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'John', 'email' => 'john@testaccount.com', 'mobile' => '6012345678' }, 'recipient' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'Lisa', 'email' => 'lisa@testaccount.com', 'mobile' => '6281234567890' } } }

      it 'returns a FixedValueVoucher response' do
        expect(InkindApi::Entity::Response::FixedValueVoucher)
          .to receive(:new)
          .at_least(:once)
          .and_call_original

        VCR.use_cassette('fixed_value_vouchers') do
          expect(subject.fixed_value_voucher(attributes: valid_parameters)).to be_a InkindApi::Entity::Response::FixedValueVoucher
        end
      end
    end
  end
end

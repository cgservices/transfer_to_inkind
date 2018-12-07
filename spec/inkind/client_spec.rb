describe InkindApi::Client do
  subject { described_class.new(config: InkindApi::Config.new) }

  describe '#ping?' do
    it 'calls ping? from the discovery request' do
      expect(InkindApi::Request::Discovery)
        .to receive(:new)
        .at_least(:once)
        .and_call_original

      expect_any_instance_of(InkindApi::Request::Discovery)
        .to receive(:ping?)
        .at_least(:once)
        .and_call_original

      VCR.use_cassette('ping') { subject.ping? }
    end
  end

  describe '#countries' do
    it 'calls countries from the discovery request' do
      expect(InkindApi::Request::Discovery)
        .to receive(:new)
        .at_least(:once)
        .and_call_original

      expect_any_instance_of(InkindApi::Request::Discovery)
        .to receive(:countries)
        .at_least(:once)
        .and_call_original

      VCR.use_cassette('countries') { subject.countries }
    end
  end
  describe '#operators' do
    it 'calls operators from the discovery request' do
      expect(InkindApi::Request::Discovery)
        .to receive(:new)
        .at_least(:once)
        .and_call_original

      expect_any_instance_of(InkindApi::Request::Discovery)
        .to receive(:operators)
        .at_least(:once)
        .and_call_original

      VCR.use_cassette('operators') { subject.operators }
    end
  end
  describe '#products' do
    context 'with no operator id given' do
      it 'calls products from the discovery request' do
        expect(InkindApi::Request::Discovery)
          .to receive(:new)
          .at_least(:once)
          .and_call_original

        expect_any_instance_of(InkindApi::Request::Discovery)
          .to receive(:products)
          .at_least(:once)
          .and_call_original

        VCR.use_cassette('products') { subject.products }
      end

      context 'with an operator_id' do
        it 'calls products from the discovery request' do
          expect(InkindApi::Request::Discovery)
            .to receive(:new)
            .at_least(:once)
            .and_call_original

          expect_any_instance_of(InkindApi::Request::Discovery)
            .to receive(:products)
            .at_least(:once)
            .and_call_original

          operator = VCR.use_cassette('operators') { subject.operators.first }

          VCR.use_cassette('products') { subject.products(operator_id: operator.id) }
        end
      end
    end
  end

  describe '#servcies' do
    it 'calls services from the discovery request' do
      expect(InkindApi::Request::Discovery)
        .to receive(:new)
        .at_least(:once)
        .and_call_original

      expect_any_instance_of(InkindApi::Request::Discovery)
        .to receive(:services)
        .at_least(:once)
        .and_call_original

      VCR.use_cassette('services') { subject.services }
    end
  end

  describe '#fixed_value_voucher' do
    context 'with valid data' do
      let(:valid_parameters) { { 'account_number' => '6281234567890', 'product_id' => '112', 'external_id' => '14248512386098429', 'simulation' => '1', 'sender_sms_notification' => '1', 'sender_sms_text' => 'Sender message', 'recipient_sms_notification' => '1', 'recipient_sms_text' => 'Recipient message', 'sender' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'John', 'email' => 'john@testaccount.com', 'mobile' => '6012345678' }, 'recipient' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'Lisa', 'email' => 'lisa@testaccount.com', 'mobile' => '6281234567890' } } }
      it 'calls fixed_value_vouchers from the transaction request' do
        expect(InkindApi::Request::Transaction)
          .to receive(:new)
          .at_least(:once)
          .and_call_original

        expect_any_instance_of(InkindApi::Request::Transaction)
          .to receive(:fixed_value_voucher)
          .at_least(:once)
          .and_call_original

        VCR.use_cassette('fixed_value_vouchers') do
          expect(subject.fixed_value_voucher(valid_parameters)).to be_a InkindApi::Entity::Response::FixedValueVoucher
        end
      end
    end
  end

  describe '#fixed_value_recharge' do
    context 'with valid data' do
      let(:valid_parameters) { { 'account_number' => '6281234567890', 'product_id' => '315', 'external_id' => '14248512386098429', 'simulation' => '1', 'sender_sms_notification' => '1', 'sender_sms_text' => 'Sender message', 'recipient_sms_notification' => '1', 'recipient_sms_text' => 'Recipient message', 'sender' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'John', 'email' => 'john@testaccount.com', 'mobile' => '6012345678' }, 'recipient' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'Lisa', 'email' => 'lisa@testaccount.com', 'mobile' => '6281234567890' } } }
      it 'calls fixed_value_recharges from the transaction request' do
        expect(InkindApi::Request::Transaction)
          .to receive(:new)
                .at_least(:once)
                .and_call_original

        expect_any_instance_of(InkindApi::Request::Transaction)
          .to receive(:fixed_value_recharge)
                .at_least(:once)
                .and_call_original

        VCR.use_cassette('fixed_value_recharges') do
          expect(subject.fixed_value_recharge(valid_parameters)).to be_a InkindApi::Entity::Response::FixedValueRecharge
        end
      end
    end
  end
end

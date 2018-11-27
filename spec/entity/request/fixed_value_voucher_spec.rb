describe InkindApi::Entity::Request::FixedValueVoucher do
  let(:valid_parameters) { { 'account_number' => '6281234567890', 'product_id' => '1', 'external_id' => '14248512386098429', 'simulation' => '0', 'sender_sms_notification' => '1', 'sender_sms_text' => 'Sender message', 'recipient_sms_notification' => '1', 'recipient_sms_text' => 'Recipient message', 'sender' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'John', 'email' => 'john@testaccount.com', 'mobile' => '6012345678' }, 'recipient' => { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'Lisa', 'email' => 'lisa@testaccount.com', 'mobile' => '6281234567890' } } }
  let(:invalid_sender_parameters) { valid_parameters.merge('sender' => valid_parameters['sender'].except('mobile')) }
  let(:invalid_recipient_parameters) { valid_parameters.merge('recipient' => valid_parameters['recipient'].except('mobile')) }

  context 'with valid data' do
    subject { described_class.new(valid_parameters) }
    it 'should be valid' do
      expect(subject.valid?).to be true
    end
  end

  context 'with invalid sender' do
    subject { described_class.new(invalid_sender_parameters) }
    it 'should not be valid' do
      expect(subject.valid?).to be false
    end
  end

  context 'with invalid recipient' do
    subject { described_class.new(invalid_recipient_parameters) }
    it 'should not be valid' do
      expect(subject.valid?).to be false
    end
  end

  context 'with a missing account_number' do
    subject { described_class.new(valid_parameters.except('account_number')) }
    it 'should not be valid' do
      expect(subject.valid?).to be false
    end
  end

  context 'with a missing external_id' do
    subject { described_class.new(valid_parameters.except('external_id')) }
    it 'should not be valid' do
      expect(subject.valid?).to be false
    end
  end

  context 'with a missing product_id' do
    subject { described_class.new(valid_parameters.except('product_id')) }
    it 'should not be valid' do
      expect(subject.valid?).to be false
    end
  end

  describe '#meta_data' do
    context 'with valid data' do
      subject { described_class.new(valid_parameters) }
      it 'returns valid meta_data' do
        expect(subject.meta_data).to eq valid_parameters
      end
    end
  end
end

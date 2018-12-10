describe InkindApi::Entity::Customer do
  let(:valid_parameters) { { 'last_name' => 'Delorm', 'middle_name' => '', 'first_name' => 'John', 'email' => 'john@testaccount.com', 'mobile' => '6012345678' } }
  let(:missing_mobile_parameters) { valid_parameters.except('mobile') }
  let(:empty_mobile_parameters) { valid_parameters.merge('mobile' => '') }

  context 'with valid sender and recipient' do
    subject { described_class.new(valid_parameters) }

    it 'is valid' do
      expect(subject.valid?).to be true
    end
  end

  context 'with a missing mobile number' do
    subject { described_class.new(missing_mobile_parameters) }

    it 'is not valid' do
      expect(subject.valid?).to be false
    end
  end

  context 'with  an empty mobile number' do
    subject { described_class.new(empty_mobile_parameters) }

    it 'is not valid' do
      expect(subject.valid?).to be false
    end
  end

  describe '#meta_data' do
    context 'with a valid Customer' do
      subject { described_class.new(valid_parameters) }

      it 'returns a valid hash' do
        expect(subject.meta_data).to eq valid_parameters
      end
    end
  end
end

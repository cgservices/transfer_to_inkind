describe InkindApi::Entity::Voucher do
  let(:valid_parameters) { { 'info_1' => 'Info 1', 'currency' => 'USD', 'pin2' => '1111 2222 3333 4444', 'pin' => '2222 6666 5555 7777', 'info_3' => 'Info 3', 'value' => '20000', 'expiration_date' => '2018-11-26', 'info_2' => 'Info 2' } }

  describe '#meta_data' do
    context 'with valid data' do
      subject { described_class.new(valid_parameters) }
      it 'returns the right meta_data' do
        expect(subject.meta_data).to eq valid_parameters
      end
    end
  end
end

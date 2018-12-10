describe InkindApi::Factory::Request do
  describe '.create' do
    let(:config) { InkindApi::Config.new }

    context 'with valid type' do
      it 'returns a Discovery request with :discovery' do
        request = described_class.create(:discovery, config: config)
        expect(request).to be_a InkindApi::Request::Discovery
      end

      it 'returns a Transaction request with :transaction' do
        request = described_class.create(:transaction, config: config)
        expect(request).to be_a InkindApi::Request::Transaction
      end
    end

    context 'with invalid type' do
      it 'raises an error with :foo' do
        expect { described_class.create(:foo, config: config) }.to raise_error StandardError
      end
    end
  end
end

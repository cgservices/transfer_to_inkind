describe Inkind::Factory::Request do
  describe '.create' do
    let(:config) { Inkind::Config.new }

    context 'with valid type' do
      it 'returns a Discovery request with :discovery' do
        request = described_class.create(:discovery, config)
        expect(request).to be_a Inkind::Request::Discovery
      end

      it 'returns a Transaction request with :transaction' do
        request = described_class.create(:transaction, config)
        expect(request).to be_a Inkind::Request::Transaction
      end
    end

    context 'with invalid type' do
      it 'raises an error with :foo' do
        expect { described_class.create(:foo, config) }.to raise_error StandardError
      end
    end
  end
end

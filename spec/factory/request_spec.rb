describe InkindApi::Factory::Request do
  describe '.create' do
    let(:config) { InkindApi::Config.new }
    context 'with valid type' do
      it 'should return a Discovery request with :discovery' do
        request = InkindApi::Factory::Request.create(:discovery, config: config)
        expect(request).to be_a InkindApi::Request::Discovery
      end

      it 'should return a Transaction request with :transaction' do
        request = InkindApi::Factory::Request.create(:transaction, config: config)
        expect(request).to be_a InkindApi::Request::Transaction
      end
    end

    context 'with invalid type' do
      it 'should raise an error with :foo' do
        expect { InkindApi::Factory::Request.create(:foo, config: config) }.to raise_error StandardError
      end
    end
  end
end

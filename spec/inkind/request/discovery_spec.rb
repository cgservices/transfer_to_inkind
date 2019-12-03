describe Inkind::Request::Discovery do
  subject { described_class.new(config: Inkind::Config.new) }

  describe '#ping?' do
    it 'can ping the remote API' do
      VCR.use_cassette('ping') do
        expect(subject.ping?).to be(true)
      end
    end

    context 'when receiving a Faraday::TimeoutError' do
      before do
        allow_any_instance_of(Faraday::Connection).to receive(:get).and_raise(Faraday::TimeoutError.new)
      end
      it 'raises a Inkind::Exception::TimeoutException error' do
        expect{subject.ping?}.to raise_exception Inkind::Exception::TimeoutException
      end
    end

    context 'when receiving a Faraday::ConnectionFailed' do
      before do
        allow_any_instance_of(Faraday::Connection).to receive(:get).and_raise(Faraday::ConnectionFailed.new('connection failed'))
      end
      it 'raises a Inkind::Exception::TimeoutException error' do
        expect{subject.ping?}.to raise_exception Inkind::Exception::ConnectionException
      end
    end
  end

  describe '#countries' do
    it 'can retrieve countries' do
      expect(Inkind::Entity::Country)
        .to receive(:new)
        .at_least(:once)
        .and_call_original

      VCR.use_cassette('countries') do
        expect(subject.countries.size).to be > 0
      end
    end
  end

  describe '#operators' do
    it 'can retrieve operators' do
      expect(Inkind::Entity::Operator)
        .to receive(:new)
        .at_least(:once)
        .and_call_original
      expect(Inkind::Entity::Country)
        .to receive(:new)
        .at_least(:once)
        .and_call_original

      VCR.use_cassette('operators') do
        expect(subject.operators.size).to be > 0
      end
    end
  end

  describe '#products' do
    context 'with no operator id given' do
      it 'can retrieve products for all operators' do
        expect(Inkind::Entity::Operator)
          .to receive(:new)
          .at_least(:once)
          .and_call_original
        expect(Inkind::Entity::Country)
          .to receive(:new)
          .at_least(:once)
          .and_call_original
        expect(Inkind::Entity::FixedValueProduct)
          .to receive(:new)
          .at_least(:once)
          .and_call_original
        expect(Inkind::Entity::VariableValueProduct)
          .to receive(:new)
          .at_least(:once)
          .and_call_original

        VCR.use_cassette('products') do
          expect(subject.products.size).to be > 0
        end
      end

      context 'with an operator_id' do
        it 'can retrieve products for a specific operator' do
          expect(Inkind::Entity::Operator)
            .to receive(:new)
            .at_least(:once)
            .and_call_original
          expect(Inkind::Entity::Country)
            .to receive(:new)
            .at_least(:once)
            .and_call_original
          expect(Inkind::Entity::Product)
            .to receive(:new)
            .at_least(:once)

          operator = VCR.use_cassette('operators') { subject.operators.first }

          VCR.use_cassette('products') do
            expect(subject.products(operator_id: operator.id).size).to be > 0
          end
        end
      end
    end

    describe '#services' do
      it 'can retrieve services' do
        expect(Inkind::Entity::Service)
          .to receive(:new)
          .at_least(:once)
          .and_call_original

        VCR.use_cassette('services') do
          expect(subject.services.size).to be > 0
        end
      end
    end
  end
end

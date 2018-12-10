describe InkindApi::Request::Discovery do
  subject { described_class.new(config: InkindApi::Config.new) }

  describe '#ping?' do
    it 'can ping the remote API' do
      VCR.use_cassette('ping') do
        expect(subject.ping?).to be(true)
      end
    end
  end

  describe '#countries' do
    it 'can retrieve countries' do
      expect(InkindApi::Entity::Country)
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
      expect(InkindApi::Entity::Operator)
        .to receive(:new)
        .at_least(:once)
        .and_call_original
      expect(InkindApi::Entity::Country)
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
        expect(InkindApi::Entity::Operator)
          .to receive(:new)
          .at_least(:once)
          .and_call_original
        expect(InkindApi::Entity::Country)
          .to receive(:new)
          .at_least(:once)
          .and_call_original
        expect(InkindApi::Entity::FixedValueProduct)
          .to receive(:new)
          .at_least(:once)
          .and_call_original
        expect(InkindApi::Entity::VariableValueProduct)
          .to receive(:new)
          .at_least(:once)
          .and_call_original

        VCR.use_cassette('products') do
          expect(subject.products.size).to be > 0
        end
      end

      context 'with an operator_id' do
        it 'can retrieve products for a specific operator' do
          expect(InkindApi::Entity::Operator)
            .to receive(:new)
            .at_least(:once)
            .and_call_original
          expect(InkindApi::Entity::Country)
            .to receive(:new)
            .at_least(:once)
            .and_call_original
          expect(InkindApi::Entity::Product)
            .to receive(:new)
            .at_least(:once)

          operator = VCR.use_cassette('operators') { subject.operators.first }

          VCR.use_cassette('products') do
            expect(subject.products(operator_id: operator.id).size).to be > 0
          end
        end
      end
    end

    describe '#servcies' do
      it 'can retrieve services' do
        expect(InkindApi::Entity::Service)
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

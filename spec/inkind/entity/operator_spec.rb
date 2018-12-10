# frozen_string_literal: true

describe Inkind::Entity::Operator do
  let(:operator) { described_class.new('operator' => 'Sosh', 'operator_id' => 2, 'country_id' => 1, 'country' => 'France') }

  describe '#initialize' do
    context 'with valid values' do
      it 'initializes an operator' do
        expect(operator.id).to be 2
        expect(operator.name).to eq 'Sosh'
        expect(operator.country).to be_a Inkind::Entity::Country
        expect(operator.country.id).to be 1
        expect(operator.country.name).to eq 'France'
      end
    end

    describe '#meta_data' do
      it 'returns the right meta_data' do
        expect(operator.meta_data).to eq('id' => 2, 'name' => 'Sosh', 'country' => { 'id' => 1, 'name' => 'France' })
      end
    end
  end
end

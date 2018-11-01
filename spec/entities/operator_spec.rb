# frozen_string_literal: true

describe InkindApi::Entity::Operator do
  describe '#initialize' do
    context 'with valid values' do
      operator = described_class.new('operator' => 'Sosh', 'operator_id' => 2, 'country_id' => 1, 'country' => 'France')
      it 'initializes an operator' do
        expect(operator.id).to be 2
        expect(operator.name).to eq 'Sosh'
        expect(operator.country).to be_a InkindApi::Entity::Country
        expect(operator.country.id).to be 1
        expect(operator.country.name).to eq 'France'
      end
    end
  end
end

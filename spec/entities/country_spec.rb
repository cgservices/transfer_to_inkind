# frozen_string_literal: true

describe InkindApi::Entity::Country do
  let(:country) { described_class.new('country_id' => 1, 'country' => 'France') }
  describe '#initialize' do
    context 'with valid values' do
      it 'initializes a country' do
        expect(country.id).to be 1
        expect(country.name).to eq 'France'
      end
    end

    describe '#meta_data' do
      it 'returns the right meta_data' do
        expect(country.meta_data).to eq('id' => 1, 'name' => 'France')
      end
    end
  end
end

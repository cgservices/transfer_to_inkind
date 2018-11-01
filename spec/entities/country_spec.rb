# frozen_string_literal: true

describe InkindApi::Entity::Country do
  describe '#initialize' do
    context 'with valid values' do
      country = described_class.new('country_id' => 1, 'country' => 'France')

      it 'initializes a country' do
        expect(country.id).to be 1
        expect(country.name).to eq 'France'
      end
    end
  end
end

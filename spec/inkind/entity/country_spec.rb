# frozen_string_literal: true

describe Inkind::Entity::Country do
  subject { described_class.new('country_id' => 1, 'country' => 'France') }

  describe '#initialize' do
    context 'with valid values' do
      it 'initializes a country' do
        expect(subject.id).to be 1
        expect(subject.name).to eq 'France'
      end
    end

    describe '#meta_data' do
      it 'returns the right meta_data' do
        expect(subject.meta_data).to eq('id' => 1, 'name' => 'France')
      end
    end
  end
end

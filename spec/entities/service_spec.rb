# frozen_string_literal: true

describe InkindApi::Entity::Service do
  describe '#initialize' do
    context 'with valid values' do
      service = described_class.new('service_id' => 3, 'service' => 'television')

      it 'returns the right id' do
        expect(service.id).to be 3
      end

      it 'returns the right name' do
        expect(service.name).to eq 'television'
      end

      it 'returns the right meta_data' do
        expect(service.meta_data).to eq('id' => 3, 'name' => 'television')
      end
    end
  end
end

# frozen_string_literal: true

describe InkindApi::Entity::Service do
  describe '#initialize' do
    context 'with valid values' do
      service = described_class.new('service_id' => 3, 'service' => 'television')

      it 'initializes a service' do
        expect(service.id).to be 3
        expect(service.name).to eq 'television'
      end
    end
  end
end

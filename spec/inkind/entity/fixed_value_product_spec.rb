# frozen_string_literal: true

describe Inkind::Entity::FixedValueProduct do
  parameters = {
    'product_id' => 64,
    'product_name' => '$14 Basic',
    'product_short_desc' => '14 USD Basic',
    'operator_id' => 1959,
    'operator' => 'Claro TV Guatemala USD',
    'country_id' => 756,
    'country' => 'Guatemala',
    'service_id' => 1,
    'service' => 'television',
    'product_value' => 14,
    'product_currency' => 'USD',
    'local_value' => 14,
    'local_currency' => 'USD',
    'account_currency' => 'USD',
    'wholesale_price' => 12.5,
    'retail_price' => 13.5,
    'fee' => 0
  }

  subject { described_class.new(parameters) }

  describe '#initialize' do
    context 'with valid values' do
      it 'initializes a product with the right values' do
        expect(subject.id).to be 64
        expect(subject.name).to eq '$14 Basic'
        expect(subject.short_description).to eq '14 USD Basic'
        expect(subject.value).to eq 14
        expect(subject.currency).to eq 'USD'
        expect(subject.local_value).to eq 14
        expect(subject.local_currency).to eq 'USD'
        expect(subject.account_currency).to eq 'USD'
        expect(subject.wholesale_price).to eq 12.5
        expect(subject.retail_price).to eq 13.5
        expect(subject.fee).to eq 0
      end

      it 'initializes a product with a valid operator' do
        expect(subject.service).to be_a Inkind::Entity::Service
        expect(subject.service.id).to eq 1
        expect(subject.service.name).to eq 'television'
      end

      it 'initializes a product with a valid service' do
        expect(subject.operator).to be_a Inkind::Entity::Operator
        expect(subject.operator.id).to eq 1959
        expect(subject.operator.name).to eq 'Claro TV Guatemala USD'
      end

      it 'initializes a product with a valid country' do
        expect(subject.country).to be_a Inkind::Entity::Country
        expect(subject.country.id).to eq 756
        expect(subject.country.name).to eq 'Guatemala'
      end
    end
  end

  describe '#meta_data' do
    it 'returns the right metadata' do
      expect(subject.meta_data).to eq(
        'id' => 64,
        'name' => '$14 Basic',
        'short_description' => '14 USD Basic',
        'operator' => { 'id' => 1959, 'name' => 'Claro TV Guatemala USD', 'country' => { 'id' => 756, 'name' => 'Guatemala' } },
        'country' => { 'id' => 756, 'name' => 'Guatemala' },
        'service' => { 'id' => 1, 'name' => 'television' },
        'value' => 14,
        'currency' => 'USD',
        'local_value' => 14,
        'local_currency' => 'USD',
        'account_currency' => 'USD',
        'wholesale_price' => 12.5,
        'retail_price' => 13.5,
        'fee' => 0,
        'type' => nil
      )
    end
  end
end

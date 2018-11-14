# frozen_string_literal: true

describe InkindApi::Entity::VariableValueProduct do
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
    'product_currency' => 'USD',
    'account_currency' => 'USD'
  }

  subject { described_class.new(parameters) }

  describe '#initialize' do
    context 'with valid values' do
      it 'initializes a product with the right values' do
        expect(subject.id).to be 64
        expect(subject.name).to eq '$14 Basic'
        expect(subject.short_description).to eq '14 USD Basic'
        expect(subject.currency).to eq 'USD'
        expect(subject.account_currency).to eq 'USD'
      end

      it 'initializes a product with a valid operator' do
        expect(subject.service).to be_a InkindApi::Entity::Service
        expect(subject.service.id).to eq 1
        expect(subject.service.name).to eq 'television'
      end

      it 'initializes a product with a valid service' do
        expect(subject.operator).to be_a InkindApi::Entity::Operator
        expect(subject.operator.id).to eq 1959
        expect(subject.operator.name).to eq 'Claro TV Guatemala USD'
      end

      it 'initializes a product with a valid country' do
        expect(subject.country).to be_a InkindApi::Entity::Country
        expect(subject.country.id).to eq 756
        expect(subject.country.name).to eq 'Guatemala'
      end
    end
  end

  describe 'min' do
    it 'should return the minimal retail_price' do
      subject.suggested_values = build_suggested_values
      expect(subject.min(:retail_price)).to eq 0.2
    end

    it 'should return the minimal wholesale_price' do
      subject.suggested_values = build_suggested_values
      expect(subject.min(:wholesale_price)).to eq 0.90
    end
  end

  describe 'max' do
    it 'should return the maximal retail_price' do
      subject.suggested_values = build_suggested_values
      expect(subject.max(:retail_price)).to eq 10.00
    end

    it 'should return the maximal wholesale_price' do
      subject.suggested_values = build_suggested_values
      expect(subject.max(:wholesale_price)).to eq 9.90
    end
  end

  private

  def build_suggested_values
    [
      build(:suggested_value, retail_price: 0.2, wholesale_price: 2.90),
      build(:suggested_value, retail_price: 5.00, wholesale_price: 5.90),
      build(:suggested_value, retail_price: 3.00, wholesale_price: 9.90),
      build(:suggested_value, retail_price: 10.00, wholesale_price: 3.90),
      build(:suggested_value, retail_price: 7.00, wholesale_price: 0.90),
      build(:suggested_value, retail_price: 7.00, wholesale_price: 5.90)
    ]
  end
end
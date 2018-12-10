# frozen_string_literal: true

describe Inkind::Entity::VariableValueProduct do
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

  describe '#min' do
    it 'returns the minimal retail_price' do
      subject.suggested_values = build_suggested_values
      expect(subject.min(:retail_price)).to eq 0.2
    end

    it 'returns the minimal wholesale_price' do
      subject.suggested_values = build_suggested_values
      expect(subject.min(:wholesale_price)).to eq 0.90
    end
  end

  describe '#max' do
    it 'returns the maximal retail_price' do
      subject.suggested_values = build_suggested_values
      expect(subject.max(:retail_price)).to eq 10.00
    end

    it 'returns the maximal wholesale_price' do
      subject.suggested_values = build_suggested_values
      expect(subject.max(:wholesale_price)).to eq 9.90
    end
  end

  describe '#meta_data' do
    let(:suggested_value_params) { { 'local_value' => 9, 'local_currency' => 'INR', 'name' => '50 MB of 2G Plan for 1 Day', 'description' => 'AIRT / UPE / 9INR / 2G Plan / 50 MB / 1 Day', 'additional_info_1' => 'type:2G Plan', 'additional_info_2' => 'validity:1 Day', 'additional_info_3' => 'data_amount:50 MB', 'wholesale_price' => '0.14', 'retail_price' => '0.06', 'fee' => 0 } }

    it 'returns the right metadata' do
      suggested_value          = Inkind::Entity::SuggestedValue.new(suggested_value_params)
      subject.suggested_values = [suggested_value]

      expect(subject.meta_data).to eq(
        'id' => 64,
        'name' => '$14 Basic',
        'short_description' => '14 USD Basic',
        'operator' => { 'id' => 1959, 'name' => 'Claro TV Guatemala USD', 'country' => { 'id' => 756, 'name' => 'Guatemala' } },
        'country' => { 'id' => 756, 'name' => 'Guatemala' },
        'service' => { 'id' => 1, 'name' => 'television' },
        'currency' => 'USD',
        'account_currency' => 'USD',
        'type' => nil,
        'suggested_values' => [suggested_value_params]
      )
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

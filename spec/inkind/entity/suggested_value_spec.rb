# frozen_string_literal: true

describe Inkind::Entity::SuggestedValue do
  parameters = {
    'local_value' => 9,
    'local_currency' => 'INR',
    'name' => '50 MB of 2G Plan for 1 Day',
    'description' => 'AIRT / UPE / 9INR / 2G Plan / 50 MB / 1 Day',
    'additional_info_1' => 'type:2G Plan',
    'additional_info_2' => 'validity:1 Day',
    'additional_info_3' => 'data_amount:50 MB',
    'wholesale_price' => '0.14',
    'retail_price' => '0.06',
    'fee' => 0
  }

  subject { described_class.new(parameters) }

  describe '#initialize' do
    context 'with valid values' do
      it 'initializes a suggested value with the right values' do
        expect(subject.local_value).to eq 9
        expect(subject.local_currency).to eq 'INR'
        expect(subject.name).to eq '50 MB of 2G Plan for 1 Day'
        expect(subject.description).to eq 'AIRT / UPE / 9INR / 2G Plan / 50 MB / 1 Day'
        expect(subject.additional_info_1).to eq 'type:2G Plan'
        expect(subject.additional_info_2).to eq 'validity:1 Day'
        expect(subject.additional_info_3).to eq 'data_amount:50 MB'
        expect(subject.wholesale_price).to eq '0.14'
        expect(subject.retail_price).to eq '0.06'
        expect(subject.fee).to eq 0
      end
    end
  end

  describe '#meta_data' do
    it 'returns the right meta_data' do
      expect(subject.meta_data).to eq('local_value' => 9, 'local_currency' => 'INR', 'name' => '50 MB of 2G Plan for 1 Day', 'description' => 'AIRT / UPE / 9INR / 2G Plan / 50 MB / 1 Day', 'additional_info_1' => 'type:2G Plan', 'additional_info_2' => 'validity:1 Day', 'additional_info_3' => 'data_amount:50 MB', 'wholesale_price' => '0.14', 'retail_price' => '0.06', 'fee' => 0)
    end
  end
end

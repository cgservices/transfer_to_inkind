# frozen_string_literal: true

describe Inkind::Factory::Entity::Product do
  describe '.create' do
    context 'with a fixed_value_voucher product' do
      it 'returns a FixedValueProduct' do
        expect(described_class.create('fixed_value_vouchers', {})).to be_a Inkind::Entity::FixedValueProduct
      end
    end

    context 'with a fixed_value_recharge product' do
      it 'returns a FixedValueProduct' do
        expect(described_class.create('fixed_value_recharges', {})).to be_a Inkind::Entity::FixedValueProduct
      end
    end

    context 'with a variable_value_recharge product' do
      it 'returns a VariableValueProduct' do
        expect(described_class.create('variable_value_recharges', {})).to be_a Inkind::Entity::VariableValueProduct
      end
    end

    context 'with a non managed product type' do
      it 'returns an error' do
        expect { described_class.create('foo', {}) }.to raise_error StandardError
      end
    end
  end

  describe '.get_product_type' do
    context 'with a fixed_value_vouchers' do
      it 'returns voucher' do
        expect(described_class.get_product_type('fixed_value_vouchers')).to eq 'voucher'
      end
    end

    context 'with a fixed_value_recharges' do
      it 'returns recharge' do
        expect(described_class.get_product_type('fixed_value_recharges')).to eq 'recharge'
      end
    end

    context 'with a variable_value_recharges' do
      it 'returns recharge' do
        expect(described_class.get_product_type('variable_value_recharges')).to eq 'recharge'
      end
    end

    context 'with anything else' do
      it 'raises be nil' do
        expect(described_class.get_product_type('foo')).to be nil
      end
    end
  end

  describe '.type_supported?' do
    context 'with a fixed_value_vouchers' do
      it 'returns true' do
        expect(described_class.type_supported?('fixed_value_vouchers')).to be true
      end
    end

    context 'with a fixed_value_recharges' do
      it 'returns true' do
        expect(described_class.type_supported?('fixed_value_recharges')).to be true
      end
    end

    context 'with a variable_value_recharges' do
      it 'returns true' do
        expect(described_class.type_supported?('variable_value_recharges')).to be true
      end
    end

    context 'with anything else' do
      it 'returns false' do
        expect(described_class.type_supported?('foo')).to be false
      end
    end
  end
end

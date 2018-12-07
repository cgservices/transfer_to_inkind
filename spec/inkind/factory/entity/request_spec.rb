# frozen_string_literal: true

describe InkindApi::Factory::Entity::Request do
  describe '.create' do
    context 'with a fixed_value_voucher type' do
      it 'returns a FixedValueVoucher request' do
        expect(described_class.create('fixed_value_vouchers', {})).to be_a InkindApi::Entity::Request::FixedValueVoucher
      end
    end

    context 'with a fixed_value_recharge type' do
      it 'returns a FixedValueRecharge request' do
        expect(described_class.create('fixed_value_recharges', {})).to be_a InkindApi::Entity::Request::FixedValueRecharge
      end
    end

    context 'with a variable_value_recharge type' do
      xit 'returns a VariableValueProduct request' do
        expect(described_class.create('variable_value_recharges', {})).to be_a InkindApi::Entity::VariableValueProduct
      end
    end

    context 'with a non managed request type' do
      it 'returns an error' do
        expect { described_class.create('foo', {}) }.to raise_error StandardError
      end
    end
  end
end

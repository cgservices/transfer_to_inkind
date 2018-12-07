# frozen_string_literal: true

describe InkindApi::Factory::Entity::Response do
  describe '.create' do
    context 'with a fixed_value_voucher type' do
      it 'returns a FixedValueVoucher response' do
        expect(described_class.create('fixed_value_vouchers', {})).to be_a InkindApi::Entity::Response::FixedValueVoucher
      end
    end

    context 'with a fixed_value_recharge type' do
      it 'returns a FixedValueRecharge response' do
        expect(described_class.create('fixed_value_recharges', {})).to be_a InkindApi::Entity::Response::FixedValueRecharge
      end
    end

    context 'with a variable_value_recharge type' do
      it 'returns a VariableValueRecharge response' do
        expect(described_class.create('variable_value_recharges', {})).to be_a InkindApi::Entity::Response::VariableValueRecharge
      end
    end

    context 'with a non managed response type' do
      it 'returns an error' do
        expect { described_class.create('foo', {}) }.to raise_error StandardError
      end
    end
  end
end

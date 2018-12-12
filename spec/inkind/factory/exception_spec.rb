describe Inkind::Factory::Exception do
  subject(:factory) { described_class }
  describe '.create' do

    context "with a 1000777 code" do
      it 'should return a InsufficientBalanceMasterAccount exception' do
        expect(factory.create(1000777, nil, nil)).to be_a Inkind::Exception::InsufficientBalanceMasterAccount
      end
    end

    context "with a 1_000_888 code" do
      it 'should return a InsufficientBalanceRetailerAccount exception' do
        expect(factory.create(1000888, nil, nil)).to be_a Inkind::Exception::InsufficientBalanceRetailerAccount
      end
    end

    context "with a 1_000_999 code" do
      it 'should return a InvalidParameter exception' do
        expect(factory.create(1000999, nil, nil)).to be_a Inkind::Exception::InvalidParameter
      end

    end

    context "with a 1_000_204 code" do
      it 'should return a AccountNumberIncorrect exception' do
        expect(factory.create(1000204, nil, nil)).to be_a Inkind::Exception::AccountNumberIncorrect
      end
    end
    context "with a 1_000_207 code" do
      it 'should return a TransactionAmountLimitExceeded exception' do
        expect(factory.create(1000207, nil, nil)).to be_a Inkind::Exception::TransactionAmountLimitExceeded
      end
    end
    context "with a 1_000_212 code" do
      it 'should return a TransactionAlreadyPaid exception' do
        expect(factory.create(1000212, nil, nil)).to be_a Inkind::Exception::TransactionAlreadyPaid
      end
    end
    context "with a 1_000_213 code" do
      it 'should return a TransactionRepeated exception' do
        expect(factory.create(1000213, nil, nil)).to be_a Inkind::Exception::TransactionRepeated
      end
    end
    context "with a 1_000_214 code" do
      it 'should return a TransactionRejected exception' do
        expect(factory.create(1000214, nil, nil)).to be_a Inkind::Exception::TransactionRejected
      end
    end

    context "with a 1_000_218 code" do
      it 'should return a TransactionTimeout exception' do
        expect(factory.create(1000218, nil, nil)).to be_a Inkind::Exception::TransactionTimeout
      end
    end

    context "with a 1_000_230 code" do
      it 'should return a RecipientReachedMaximumTransactionNumber exception' do
        expect(factory.create(1000230, nil, nil)).to be_a Inkind::Exception::RecipientReachedMaximumTransactionNumber
      end
    end

    context "with a 1_000_301 code" do
      it 'should return a ProductNotAvailable exception' do
        expect(factory.create(1000301, nil, nil)).to be_a Inkind::Exception::ProductNotAvailable
      end
    end

    context "with a 1_000_302 code" do
      it 'should return a ProductNotCompatibleWithTransactionType exception' do
        expect(factory.create(1000302, nil, nil)).to be_a Inkind::Exception::ProductNotCompatibleWithTransactionType
      end
    end

    context "with a 1_000_303 code" do
      it 'should return a ProductTypeIncorrect exception' do
        expect(factory.create(1000303, nil, nil)).to be_a Inkind::Exception::ProductTypeIncorrect
      end
    end

    context "with a 1_000_304 code" do
      it 'should return a AccountVerificationNotAvailableForThisProduct exception' do
        expect(factory.create(1000304, nil, nil)).to be_a Inkind::Exception::AccountVerificationNotAvailableForThisProduct
      end
    end

    context "with a 1_000_990 code" do
      it 'should return a ExternalIdAlreadyUsed exception' do
        expect(factory.create(1000990, nil, nil)).to be_a Inkind::Exception::ExternalIdAlreadyUsed
      end
    end

    context "with a 1_000_401 code" do
      it 'should return a Unauthorized exception' do
        expect(factory.create(1000401, nil, nil)).to be_a Inkind::Exception::Unauthorized
      end
    end

    context "with a 1_000_404 code" do
      it 'should return a TransactionNotFound exception' do
        expect(factory.create(1000404, nil, nil)).to be_a Inkind::Exception::TransactionNotFound
      end
    end

    context "with a 1_000_500 code" do
      it 'should return a InternalServerError exception' do
        expect(factory.create(1000500, nil, nil)).to be_a Inkind::Exception::InternalServerError
      end
    end

    context "with an unknown code" do
      it 'should return a UnmappedResponse exception' do
        expect(factory.create(500, nil, nil)).to be_a Inkind::Exception::UnmappedResponse
      end
    end
  end
end
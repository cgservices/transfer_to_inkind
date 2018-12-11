module Inkind
  module Factory
    class Exception
      def self.create(code, message, raw_response)
        case code
        when 1_000_777
          Inkind::Exception::InsufficientBalanceMasterAccount.new(code, message, raw_response)
        when 1_000_888
          Inkind::Exception::InsufficientBalanceRetailerAccount.new(code, message, raw_response)
        when 1_000_999
          Inkind::Exception::InvalidParameter.new(code, message, raw_response)
        when 1_000_204
          Inkind::Exception::AccountNumberIncorrect.new(code, message, raw_response)
        when 1_000_207
          Inkind::Exception::TransactionAmountLimitExceeded.new(code, message, raw_response)
        when 1_000_212
          Inkind::Exception::TransactionAlreadyPaid.new(code, message, raw_response)
        when 1_000_213
          Inkind::Exception::TransactionRepeated.new(code, message, raw_response)
        when 1_000_214
          Inkind::Exception::TransactionRejected.new(code, message, raw_response)
        when 1_000_218
          Inkind::Exception::TransactionTimeout.new(code, message, raw_response)
        when 1_000_230
          Inkind::Exception::RecipientReachedMaximumTransactionNumber.new(code, message, raw_response)
        when 1_000_301
          Inkind::Exception::ProductNotAvailable.new(code, message, raw_response)
        when 1_000_302
          Inkind::Exception::ProductNotCompatibleWithTransactionType.new(code, message, raw_response)
        when 1_000_303
          Inkind::Exception::ProductTypeIncorrect.new(code, message, raw_response)
        when 1_000_304
          Inkind::Exception::AccountVerificationNotAvailableForThisProduct.new(code, message, raw_response)
        when 1_000_990
          Inkind::Exception::ExternalIdAlreadyUsed.new(code, message, raw_response)
        when 1_000_401
          Inkind::Exception::Unauthorized.new(code, message, raw_response)
        when 1_000_404
          Inkind::Exception::TransactionNotFound.new(code, message, raw_response)
        when 1_000_500
          Inkind::Exception::InternalServerError.new(code, message, raw_response)
        else
          Inkind::Exception::UnmappedResponse.new(code, message, raw_response)
        end
      end
    end
  end
end

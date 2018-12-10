module Inkind
  class ResponseException < StandardError
    def initialize(code, message, raw_response)
      case code
      when 1_000_777
        raise InsufficientBalanceMasterAccount.new(code, message, raw_response)
      when 1_000_888
        raise InsufficientBalanceRetailerAccount.new(code, message, raw_response)
      when 1_000_999
        raise InvalidParameter.new(code, message, raw_response)
      when 1_000_204
        raise AccountNumberIncorrect.new(code, message, raw_response)
      when 1_000_207
        raise TransactionAmountLimitExceeded.new(code, message, raw_response)
      when 1_000_212
        raise TransactionAlreadyPaid.new(code, message, raw_response)
      when 1_000_213
        raise TransactionRepeated.new(code, message, raw_response)
      when 1_000_214
        raise TransactionRejected.new(code, message, raw_response)
      when 1_000_218
        raise TransactionTimeout.new(code, message, raw_response)
      when 1_000_230
        raise RecipientReachedMaximumTransactionNumber.new(code, message, raw_response)
      when 1_000_301
        raise ProductNotAvailable.new(code, message, raw_response)
      when 1_000_302
        raise ProductNotCompatibleWithTransactionType.new(code, message, raw_response)
      when 1_000_303
        raise ProductTypeIncorrect.new(code, message, raw_response)
      when 1_000_304
        raise AccountVerificationNotAvailableForThisProduct.new(code, message, raw_response)
      when 1_000_990
        raise ExternalIdAlreadyUsed.new(code, message, raw_response)
      when 1_000_401
        raise Unauthorized.new(code, message, raw_response)
      when 1_000_404
        raise TransactionNotFound.new(code, message, raw_response)
      when 1_000_500
        raise InternalServerError.new(code, message, raw_response)
      else
        raise UnmappedResponse.new(code, message, raw_response)
      end
    end

    class CommandException < ResponseException
      attr_accessor :code, :message, :raw_response

      def initialize(code, message, raw_response)
        @code         = code
        @message      = message
        @raw_response = raw_response
      end
    end

    class InsufficientBalanceMasterAccount < CommandException; end
    class InsufficientBalanceRetailerAccount < CommandException; end
    class InvalidParameter < CommandException; end
    class AccountNumberIncorrect < CommandException; end
    class TransactionAmountLimitExceeded < CommandException; end
    class TransactionAlreadyPaid < CommandException; end
    class TransactionRepeated < CommandException; end
    class TransactionRejected < CommandException; end
    class TransactionTimeout < CommandException; end
    class RecipientReachedMaximumTransactionNumber < CommandException; end
    class ProductNotAvailable < CommandException; end
    class ProductNotCompatibleWithTransactionType < CommandException; end
    class ProductTypeIncorrect < CommandException; end
    class AccountVerificationNotAvailableForThisProduct < CommandException; end
    class ExternalIdAlreadyUsed < CommandException; end
    class Unauthorized < CommandException; end
    class TransactionNotFound < CommandException; end
    class InternalServerError < CommandException; end
    class UnmappedResponse < CommandException; end
  end
end

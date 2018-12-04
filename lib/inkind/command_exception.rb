module InkindApi
  class ResponseException < StandardError
    def initialize(code, message, raw_response)
      case code
      when 1000777
        raise InsufficientBalanceMasterAccount.new(code, message, raw_response)
      when 1000888
        raise InsufficientBalanceRetailerAccount.new(code, message, raw_response)
      when 1000999
        raise InvalidParameter.new(code, message, raw_response)
      when 1000204
        raise AccountNumberIncorrect.new(code, message, raw_response)
      when 1000207
        raise TransactionAmountLimitExceeded.new(code, message, raw_response)
      when 1000212
        raise TransactionAlreadyPaid.new(code, message, raw_response)
      when 1000213
        raise TransactionRepeated.new(code, message, raw_response)
      when 1000214
        raise TransactionRejected.new(code, message, raw_response)
      when 1000218
        raise TransactionTimeout.new(code, message, raw_response)
      when 1000230
        raise RecipientReachedMaximumTransactionNumber.new(code, message, raw_response)
      when 1000301
        raise ProductNotAvailable.new(code, message, raw_response)
      when 1000302
        raise ProductNotCompatibleWithTransactionType.new(code, message, raw_response)
      when 1000303
        raise ProductTypeIncorrect.new(code, message, raw_response)
      when 1000304
        raise AccountVerificationNotAvailableForThisProduct.new(code, message, raw_response)
      when 1000990
        raise ExternalIdAlreadyUsed.new(code, message, raw_response)
      when 1000401
        raise Unauthorized.new(code, message, raw_response)
      when 1000404
        raise TransactionNotFound.new(code, message, raw_response)
      when 1000500
        raise InternalServerError.new(code, message, raw_response)
      else
        raise UnmappedResponse.new(code, message, raw_response)
      end
    end

    class CommandException < ResponseException
      attr_accessor :code, :message, :raw_response

      def initialize(code, message, raw_response)
        raise ApiResponseError(raw_response) unless code.present? && message.present?

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
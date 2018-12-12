module Inkind
  module Exception
    class ResponseException < StandardError
      attr_accessor :code, :message, :raw_response

      def initialize(code, message, raw_response)
        @code         = code
        @message      = message
        @raw_response = raw_response
      end
    end

    class InsufficientBalanceMasterAccount < ResponseException; end
    class InsufficientBalanceRetailerAccount < ResponseException; end
    class InvalidParameter < ResponseException; end
    class AccountNumberIncorrect < ResponseException; end
    class TransactionAmountLimitExceeded < ResponseException; end
    class TransactionAlreadyPaid < ResponseException; end
    class TransactionRepeated < ResponseException; end
    class TransactionRejected < ResponseException; end
    class TransactionTimeout < ResponseException; end
    class RecipientReachedMaximumTransactionNumber < ResponseException; end
    class ProductNotAvailable < ResponseException; end
    class ProductNotCompatibleWithTransactionType < ResponseException; end
    class ProductTypeIncorrect < ResponseException; end
    class AccountVerificationNotAvailableForThisProduct < ResponseException; end
    class ExternalIdAlreadyUsed < ResponseException; end
    class Unauthorized < ResponseException; end
    class TransactionNotFound < ResponseException; end
    class InternalServerError < ResponseException; end
    class UnmappedResponse < ResponseException; end
  end
end

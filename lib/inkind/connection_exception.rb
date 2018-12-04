module InkindApi

  class ConnectionException < StandardError; end
  class ConnectionError < ConnectionException; end

  # General Api response exception
  class ApiResponseException < ConnectionException
    attr_accessor :raw_response

    def initialize(raw_response)
      @raw_response = raw_response
    end
  end
end
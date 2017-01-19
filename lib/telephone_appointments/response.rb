module TelephoneAppointments
  class Response
    def initialize(response)
      @response = response
    end

    def success?
      response.is_a? Net::HTTPSuccess
    end

    def errors
      return {} if success? || response.body.nil? || response.body == ''
      JSON.parse(response.body)
    end

    private

    attr_reader :response
  end
end

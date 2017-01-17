require 'open-uri'

module TelephoneAppointments
  class Api
    private

    def headers_and_options
      {}.tap do |hash|
        hash[:read_timeout]   = read_timeout
        hash['Authorization'] = "Bearer #{bearer_token}" if bearer_token
        hash['Accept'] = 'application/json'
      end
    end

    def bearer_token
      ENV['TELEPHONE_APPOINTMENTS_API_BEARER_TOKEN']
    end

    def api_uri
      ENV.fetch('TELEPHONE_APPOINTMENTS_API_URI', 'http://localhost:3001')
    end

    def read_timeout
      ENV.fetch('TELEPHONE_APPOINTMENTS_API_READ_TIMEOUT', 5).to_i
    end
  end
end

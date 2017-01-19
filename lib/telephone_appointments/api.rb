require 'open-uri'

module TelephoneAppointments
  class Api
    def post(path, form_data)
      uri = URI.parse("#{api_uri}#{path}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.read_timeout = read_timeout
      request = Net::HTTP::Post.new(uri.request_uri, headers)
      request.set_form_data(form_data)

      Response.new(http.request(request))
    end

    private

    def headers
      {}.tap do |hash|
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

module TelephoneAppointments
  class StubApi
    def post(*)
      Response.new(Net::HTTPSuccess.new(nil, nil, nil))
    end
  end
end

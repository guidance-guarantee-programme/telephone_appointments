module TelephoneAppointments
  class SummaryDocumentActivity
    PATH = '/api/v1/summary_documents'.freeze

    def initialize(appointment_id:, owner_uid:)
      @appointment_id = appointment_id
      @owner_uid = owner_uid
    end

    def save
      @response = TelephoneAppointments.api.post(
        PATH,
        appointment_id: @appointment_id,
        owner_uid: @owner_uid
      )
      @response.success?
    end

    def errors
      @response || raise(TelephoneAppointments::UnsavedObject, 'Please save the object before accessing the errors')
      @response.errors
    end
  end
end

module TelephoneAppointments
  class DroppedSummaryDocumentActivity
    def initialize(appointment_id)
      @appointment_id = appointment_id
    end

    def save
      response = TelephoneAppointments.api.post(
        "/api/v1/appointments/#{@appointment_id}/dropped_summary_documents"
      )

      response.success?
    end
  end
end

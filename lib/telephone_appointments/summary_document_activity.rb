module TelephoneAppointments
  class SummaryDocumentActivity
    class InvalidDeliveryMethod < StandardError; end

    VALID_DELIVERY_METHODS = %w(postal digital).freeze
    PATH = '/api/v1/summary_documents'.freeze

    def initialize(appointment_id:, owner_uid:, delivery_method:)
      raise(InvalidDeliveryMethod, delivery_method) unless VALID_DELIVERY_METHODS.include?(delivery_method)

      @appointment_id = appointment_id
      @owner_uid = owner_uid
      @delivery_method = delivery_method
    end

    def save
      @response = TelephoneAppointments.api.post(
        PATH,
        appointment_id: @appointment_id,
        owner_uid: @owner_uid,
        delivery_method: @delivery_method
      )
      @response.success?
    end

    def errors
      @response || raise(TelephoneAppointments::UnsavedObject, 'Please save the object before accessing the errors')
      @response.errors
    end
  end
end

require 'telephone_appointments/version'
require 'telephone_appointments/api'

require 'telephone_appointments/response'
require 'telephone_appointments/summary_document_activity'
require 'telephone_appointments/dropped_summary_document_activity'

require 'active_support/core_ext/module/attribute_accessors'

module TelephoneAppointments
  mattr_writer :api

  def self.api
    @api ||= TelephoneAppointments::Api.new
  end

  class UnsavedObject < StandardError; end
end

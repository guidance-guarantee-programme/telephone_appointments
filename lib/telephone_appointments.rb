require 'telephone_appointments/version'
require 'telephone_appointments/api'

require 'active_support/core_ext/module/attribute_accessors'

module TelephoneAppointments
  mattr_writer :api

  def self.api
    @api ||= TelephoneAppointments::Api.new
  end
end

require 'spec_helper'

RSpec.describe 'Create a failed summary document delivery', vcr: true do
  it 'is created successfully' do
    activity = TelephoneAppointments::DroppedSummaryDocumentActivity.new('102176')

    expect(activity.save).to be_truthy
  end
end

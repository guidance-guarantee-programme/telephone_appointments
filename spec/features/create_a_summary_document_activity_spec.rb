require 'spec_helper'

RSpec.describe 'Summary document activity', vcr: true do
  it 'is successfully created' do
    summary_document = TelephoneAppointments::SummaryDocumentActivity.new(
      appointment_id: 35,
      owner_uid: '7827dce2-df16-4e92-ba69-39c05f27720b'
    )
    expect(summary_document.save).to be true
  end

  it 'it lists the errors when the create is unsuccessful' do
    summary_document = TelephoneAppointments::SummaryDocumentActivity.new(
      appointment_id: nil,
      owner_uid: nil
    )

    expect(summary_document.save).to be false
    expect(summary_document.errors).to eq(
      'appointment' => ['can\'t be blank'],
      'owner' => ['can\'t be blank']
    )
  end
end

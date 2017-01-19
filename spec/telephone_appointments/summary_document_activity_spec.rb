require 'spec_helper'

RSpec.describe TelephoneAppointments::SummaryDocumentActivity do
  subject { described_class.new(appointment_id: 12, owner_uid: 'abc') }

  describe '#errors' do
    context 'when called before the object has been saved' do
      it 'raises an error' do
        expect { subject.errors }.to raise_error(
          TelephoneAppointments::UnsavedObject,
          'Please save the object before accessing the errors'
        )
      end
    end

    context 'when the object has been saved' do
      let(:response) { double(:response, errors: [], success?: true) }
      let(:fake_api) { double(:api, post: response) }

      before do
        allow(TelephoneAppointments.api).to receive(:post).and_return(response)
        subject.save
      end

      it 'delegates to the response object' do
        expect(response).to receive(:errors)
        subject.errors
      end
    end
  end
end

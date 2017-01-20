require 'spec_helper'

RSpec.describe TelephoneAppointments::SummaryDocumentActivity do
  subject { described_class.new(appointment_id: 12, owner_uid: 'abc', delivery_method: 'postal') }

  describe '.new' do
    context 'with a valid delivery method' do
      it 'does not raise an error' do
        described_class.new(appointment_id: 1, owner_uid: '', delivery_method: 'postal')
        described_class.new(appointment_id: 1, owner_uid: '', delivery_method: 'digital')
      end
    end

    context 'with an invalid delivery method' do
      it 'raises an error' do
        expect do
          described_class.new(appointment_id: nil, owner_uid: nil, delivery_method: 'other')
        end.to raise_error(described_class::InvalidDeliveryMethod, 'other')
      end
    end
  end

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

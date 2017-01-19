require 'spec_helper'

RSpec.describe TelephoneAppointments::Response do
  subject { described_class.new(response) }

  context 'when the response is valid' do
    let(:response) { Net::HTTPSuccess.new(nil, nil, nil) }

    it 'is a success' do
      expect(subject).to be_success
    end

    it 'does not have any errors' do
      expect(subject.errors).to eq({})
    end
  end

  context 'when the response is not valid' do
    let(:response) { double(body: { trade: 'invalid' }.to_json) }

    it 'is not a success' do
      expect(subject).not_to be_success
    end

    it 'returns hash of errors parsed from the body text' do
      expect(subject.errors).to eq('trade' => 'invalid')
    end

    context 'when no body is returned' do
      let(:response) { double(body: nil) }

      it 'is not a success' do
        expect(subject).not_to be_success
      end

      it 'returns an empty error hash' do
        expect(subject.errors).to eq({})
      end
    end
  end
end

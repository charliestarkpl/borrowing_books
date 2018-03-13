require 'rails_helper'

RSpec.describe NotifyServiceFailure do
  let(:url) { 'http://example.com' }
  let(:service) { RequestApi.new(url) }
  let(:deliveries) { ActionMailer::Base.deliveries }

  subject { described_class.new(service) }

  context 'when status code is 200' do
    before { stub_request(:get, url).to_return(status: 200) }

    it 'returns nil' do
      expect(subject.call).to be_nil
    end
  end

  context 'when status code is 400' do
    before { stub_request(:get, url).to_return(status: 400) }

    it 'performs a send notification worker' do
      perform_enqueued_jobs do
        expect { subject.call }.to change { deliveries.count }.by(1)
      end
    end
  end

  context 'when status code is 500' do
    before { stub_request(:get, url).to_return(status: 500) }

    it 'performs a send notification worker' do
      perform_enqueued_jobs do
        expect { subject.call }.to change { deliveries.count }.by(1)
      end
    end
  end
end

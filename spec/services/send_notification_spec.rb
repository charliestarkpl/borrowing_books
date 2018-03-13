require 'rails_helper'

RSpec.describe SendNotification do
  subject { described_class.new }

  let(:deliveries) { ActionMailer::Base.deliveries }

  it 'sends an email notification' do
    perform_enqueued_jobs do
      expect { subject.call }.to change { deliveries.count }.by(1)
    end
  end
end

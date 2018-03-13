require 'rails_helper'

RSpec.describe RequestApi do
  let(:url) { 'http://example.com' }

  subject { described_class.new(url) }

  context 'when the status code is 200' do
    before { stub_request(:get, url).to_return(status: 200) }

    it 'returns true' do
      expect(subject.call).to eq(true)
    end
  end

  context 'when the status code is 400' do
    before { stub_request(:get, url).to_return(status: 400) }

    it 'returns false' do
      expect(subject.call).to eq(false)
    end
  end

  context 'when the status code is 500' do
    before { stub_request(:get, url).to_return(status: 500) }

    it 'returns false' do
      expect(subject.call).to eq(false)
    end
  end
end

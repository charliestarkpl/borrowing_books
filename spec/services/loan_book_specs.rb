require 'rails_helper'

RSpec.describe LoanBook, type: :service do
  let!(:user) { create(:user) }
  let!(:book) { create(:book, borrowed: false) }

  subject { described_class.new(book.id, user.id) }

  describe 'before service is called' do
    it 'counts 0 Loans' do
      expect(Loan.all.count).to eq 0
    end
  end

  describe 'Service' do
    it 'creates a new Loan' do
      expect { subject.call }.to change { Loan.all.count }.by(1)
    end

    it 'creates loan with user id' do
      subject.call
      expect(Loan.last.user_id).to eq user.id
    end

    it 'creates loan witn book id' do
      subject.call
      expect(Loan.last.book_id).to eq book.id
    end

    it 'change books borrowed status to true' do
      expect { subject.call }.to change { book.reload.borrowed }.to true
    end
  end
end

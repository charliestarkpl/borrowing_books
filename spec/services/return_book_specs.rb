require 'rails_helper'

RSpec.describe ReturnBook, type: :service do
  let!(:user) { create(:user) }
  let!(:book) { create(:book, borrowed: true) }
  let!(:loan) { create(:loan, book_id: book.id, user_id: user.id) }

  subject { described_class.new(book.id, user.id) }

  describe 'before service is called' do
    it 'counts 0 Loans' do
      expect(Loan.all.count).to eq 1
    end
  end

  describe 'Service' do
    it 'changes loan status' do
      expect { subject.call }.to change { loan.reload.status }.to 'closed'
    end

    it 'change books borrowed status to true' do
      expect { subject.call }.to change { book.reload.borrowed }.to false
    end
  end
end

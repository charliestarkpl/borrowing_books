class Loan < ApplicationRecord
  enum status: [:active, :closed]

  belongs_to :book
  belongs_to :user

  scope :book_history, -> (book) { includes(:book).where(books: { id: book.id }) }
  scope :book_by_user, -> (book, user) { includes(:book, :user).where(books: { id: book.id }).where(users: { id: user.id }) }

  def close_loan!
    update(status: 1, return_date: Date.today)
  end
end

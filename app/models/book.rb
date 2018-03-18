class Book < ApplicationRecord
  belongs_to :author
  has_many :loans
  has_many :users, through: :loans
  has_many :comments, as: :commentable, dependent: :destroy

  scope :checkout_history, -> (book) { includes(:loans).where('loans.book_id = :id', id: book.id) }
  scope :active_loans, -> { includes(:loans).where(loans: { status: 'active' }) }
  validates :title, presence: true
end

class Book < ApplicationRecord
  belongs_to :author
  has_many :loans
  has_many :users, through: :loans
  has_many :comments, as: :commentable, dependent: :destroy

  scope :with_open_loans, -> { includes(:loans).where(loans: { status: 'active' }) }
  scope :with_authors, -> { includes(:author) }

  validates :title, presence: true

  def toggle_borrow!
     update borrowed: !borrowed
  end

  def borrowed_by?(user)
    loan = Loan.book_by_user(self, user).where(status: 'active')&.take
    loan.nil?
  end
end

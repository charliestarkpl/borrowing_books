class Book < ApplicationRecord
  belongs_to :author
  has_many :loans
  has_many :users, through: :loans
  has_many :comments, as: :commentable, dependent: :destroy

  scope :with_authors_and_loans, -> { includes(:author, :loans) }

  validates :title, presence: true

  def toggle_borrow!
     update borrowed: !borrowed
  end

  def borrowed_by?(user)
    (Loan.book_by_user(self, user).where(status: 'active')&.take).present?
  end
end

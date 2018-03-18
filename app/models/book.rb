class Book < ApplicationRecord
  belongs_to :author
  has_many :loans
  has_many :users, through: :loans
  has_many :comments, as: :commentable, dependent: :destroy

  scope :with_open_loans, -> { includes(:loans).where(loans: { status: 'active' }) }

  validates :title, presence: true

  def toggle_borrow!
     update borrowed: !borrowed
  end
end

class Book < ApplicationRecord
  has_many :loans
  belongs_to :author
  has_many :comments, as: :commentable, dependent: :destroy

  scope :
  validates :title, presence: true
end

class Loan < ApplicationRecord
  enum status: [:active, :closed]

  belongs_to :book
  belongs_to :user
end

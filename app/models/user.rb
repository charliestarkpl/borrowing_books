class User < ApplicationRecord
  has_many :loans
  has_many :books, through: :loans
  has_many :comments

  devise :omniauthable, omniauth_providers: [:google_oauth2]

  scope :with_books, -> { joins(:books, :loans) }

  before_destroy :return_books


  def self.from_omniauth(auth)
    where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |user|
      user.name = auth[:info][:name]
      user.email = auth[:info][:email]
    end
  end

  def return_books
    loans.each { |b| b.update(status: 1, return_date: Date.today) }
  end
end

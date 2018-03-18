require 'ffaker'

FactoryBot.define do
  factory :loan do
    association :book, factory: :book
    association :user, factory: :user
    checkout_date Date.today - 10
  end
end

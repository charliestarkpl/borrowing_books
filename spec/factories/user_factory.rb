require 'ffaker'

FactoryBot.define do
  factory :user do
    name { FFaker::Name.first_name }
    sequence(:email) { |n| "test#{n}@example.com" }
  end
end

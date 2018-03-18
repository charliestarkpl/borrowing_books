require 'ffaker'

FactoryBot.define do
  factory :author do
    full_name { FFaker::Name.first_name }
    sequence(:bio) { |n| "I know stuff #{n}" }
  end
end

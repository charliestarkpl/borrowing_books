FactoryBot.define do
  factory :comment do
    sequence(:body) { |n| "I know stuff #{n}" }
    association :commentable, factory: :book
    association :user, factory: :user
  end
end

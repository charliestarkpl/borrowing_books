FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "Awesome book #{n}" }
    desc 'Really awesome book!'
    borrowed false
    association :author, factory: :author
  end
end

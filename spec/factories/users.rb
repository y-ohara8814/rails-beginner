FactoryBot.define do
  factory :user do
    name "Jon"
    sequence(:email) { |n| "tester#{n}@example.com"}
    password "11111111"
  end
end

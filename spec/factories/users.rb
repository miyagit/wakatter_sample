FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password123" }
    password_confirmation { "password123" }
    sequence(:username) { |n| "user#{n}" }
    job { "Engineer" }
    profile { "This is a test user profile." }
  end
end
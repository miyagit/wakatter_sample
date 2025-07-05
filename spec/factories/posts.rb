FactoryBot.define do
  factory :post do
    title { "Sample Post Title" }
    url { "https://example.com" }
    description { "This is a sample post description." }
    likes_count { 0 }
    association :category
    association :user
  end
end
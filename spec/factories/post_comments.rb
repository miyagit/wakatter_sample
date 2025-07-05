FactoryBot.define do
  factory :post_comment do
    body { "This is a sample comment." }
    association :user
    association :post
  end
end
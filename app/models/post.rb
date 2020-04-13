class Post < ApplicationRecord
  belongs_to :category
  has_many :post_comments, dependent: :destroy
end

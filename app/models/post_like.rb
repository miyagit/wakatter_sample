class PostLike < ApplicationRecord
  belogs_to :user
  belogs_to :post
end

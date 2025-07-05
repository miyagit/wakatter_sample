class GroupPost < ApplicationRecord
  belongs_to :group
  belongs_to :post
  
  validates :post_id, uniqueness: { scope: :group_id }
end

class AddCategoryIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :category_id, :bigint
    add_foreign_key :posts, :categories
    add_index  :posts,  :category_id
  end
end

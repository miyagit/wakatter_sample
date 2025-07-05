class CreateGroupPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :group_posts do |t|
      t.references :group, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
    
    add_index :group_posts, [:group_id, :post_id], unique: true
  end
end

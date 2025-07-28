class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.text :description
      t.integer :creator_id, null: false

      t.timestamps
    end
    
    add_index :groups, :creator_id
    add_foreign_key :groups, :users, column: :creator_id
  end
end

class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :message_room, null: false, foreign_key: true
      t.text :content, null: false
      t.boolean :read, default: false

      t.timestamps
    end
  end
end

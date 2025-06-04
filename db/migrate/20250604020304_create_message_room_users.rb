class CreateMessageRoomUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :message_room_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :message_room, null: false, foreign_key: true

      t.timestamps
    end
    
    add_index :message_room_users, [:user_id, :message_room_id], unique: true
  end
end

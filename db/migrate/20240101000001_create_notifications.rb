class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :recipient, foreign_key: { to_table: :users }, null: false
      t.references :actor, foreign_key: { to_table: :users }, null: false
      t.references :notifiable, polymorphic: true, null: false
      t.boolean :read, default: false
      t.timestamps
    end

    add_index :notifications, [:recipient_id, :read]
    add_index :notifications, [:notifiable_type, :notifiable_id]
  end
end
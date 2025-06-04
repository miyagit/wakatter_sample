class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, ImageUploader

  has_many :posts
  has_many :post_likes
  has_many :post_comments

  validates :username, presence: true

  # 既存のUserモデルに追加
  has_many :message_room_users, dependent: :destroy
  has_many :message_rooms, through: :message_room_users
  has_many :messages, dependent: :destroy

  # DMルームを取得または作成するメソッド
  def find_or_create_dm_room_with(other_user)
    # 既存のDMルームを探す
    message_room = message_rooms.joins(:users)
                               .where(users: { id: other_user.id })
                               .first

    # なければ新規作成
    unless message_room
      message_room = MessageRoom.create
      message_room.message_room_users.create(user: self)
      message_room.message_room_users.create(user: other_user)
    end

    message_room
  end
end

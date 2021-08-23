class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chats
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :experience

  with_options presence: true do
        validates :name
        validates :email
        validates :password
        validates :nickname
        validates :profile
        validates :experience_id, numericality: { other_than: 1, message: "を選んで下さい"}
  end

  mount_uploader :profile_image, ImageUploader


  def already_liked?(chat)
    self.likes.exists?(chat_id:chat.id)
  end

  def self.guest
    find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト'
      user.nickname = 'ゲスト'
      user.profile = 'サウナー'
      user.experience_id = 2
    end
  end

  
  
end

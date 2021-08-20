class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chats
  has_many :comments, dependent: :destroy

  with_options presence: true do
        validates :name
        validates :email
        validates :password
        validates :nickname
        validates :profile
        validates :experience
  end
  mount_uploader :profile_image, ImageUploader

  def self.guest
    find_or_create_by(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト'
      user.nickname = 'ゲスト'
      user.profile = 'サウナー'
      user.experience = '最近始めました'
    end
  end
  
end

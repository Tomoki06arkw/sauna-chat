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
  
end

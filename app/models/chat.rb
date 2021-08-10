class Chat < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :area
    belongs_to :price

  with_options presence: true do
    validates :area_id,     numericality: { other_than: 1, message: "can't be blank" } 
    validates :price_id,    numericality: { other_than: 1, message: "can't be blank" } 
    validates :sauna_name
    validates :description
    validates :image
  end

  def was_attached?
    self.image.attached?
  end
  def self.search(search)
    if search != ""
      Chat.where('sauna_name LIKE(?)', "%#{search}%")
    else
      Chat.all
    end
  end

end

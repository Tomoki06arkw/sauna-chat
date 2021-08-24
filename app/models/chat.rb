class Chat < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :price
  belongs_to :sauna_temperature
  belongs_to :water_bath

  with_options presence: true do
    with_options numericality: { other_than: 1, message: "を選んで下さい" } do
      validates :area_id 
      validates :price_id
      validates :sauna_temperature_id
      validates :water_bath_id
    end
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

class Chat < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :area

  with_options presence: true do
    validates :area_id,     numericality: { other_than: 1, message: "can't be blank" } 
    validates :price
    validates :sauna_name
    validates :description
    validates :image
  end

  def was_attached?
    self.image.attached?
  end

end

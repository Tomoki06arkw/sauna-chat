class Chat < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :area_id
    validates :price
    validates :sauna_name
    validates :description
    validates :image
  end

  def was_attached?
    self.image.attached?
  end

end

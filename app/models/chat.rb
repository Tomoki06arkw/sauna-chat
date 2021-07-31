class Chat < ApplicationRecord

  with_options: presence: true do
    validates :area_id
    validates :price
    validates :sauna_name
    validates :description
  end

  belongs_to :user
  has_one_attached :image
end

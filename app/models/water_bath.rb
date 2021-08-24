class WaterBath < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '20℃' },
    { id: 3, name: '19~17℃' },
    { id: 4, name: '16~14℃' },
    { id: 5, name: '14℃以下' },
  ]
  include ActiveHash::Associations
  has_many :chats
  
end
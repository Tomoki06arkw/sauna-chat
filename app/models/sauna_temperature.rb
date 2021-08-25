class SaunaTemperature < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '70℃' },
    { id: 3, name: '80℃' },
    { id: 4, name: '90℃' },
    { id: 5, name: '100℃以上' },
  ]
  
  include ActiveHash::Associations
  has_many :chats
  
end
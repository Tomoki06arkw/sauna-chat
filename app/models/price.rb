class Price < ActiveHash::Base
  self.data = [
    {id: 1, name: '--'}, {id: 2, name: '0~500'}, {id: 3, name: '500~1000'}, 
    {id: 4, name: '1000~1500'}, {id: 5, name: '1500~2000'}, {id: 6, name: '2000~~'}
  ]
  
    include ActiveHash::Associations
  has_many :chats
  
end
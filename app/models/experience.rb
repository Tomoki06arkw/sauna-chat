class Experience < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '初心者（半年）' },
    { id: 3, name: '１〜３年' },
    { id: 4, name: '３〜５年' },
    { id: 5, name: '５年以上' },
  ]

  include ActiveHash::Associations
  has_many :users
  
end
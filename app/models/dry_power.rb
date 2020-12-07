class DryPower < ActiveHash::Base
  self.data = [
    { id: 1, name: '2Kg' },
    { id: 2, name: '2.5Kg' },
    { id: 3, name: '3Kg' },
    { id: 4, name: '3.5Kg' },
    { id: 5, name: '4Kg' },
    { id: 6, name: '4.5Kg' },
    { id: 7, name: '5Kg' },
    { id: 8, name: '5.5Kg' },
    { id: 9, name: '6Kg' },
    { id: 10, name: '6.5Kg' },
    { id: 11, name: '7Kg' },
  ]

  include ActiveHash::Associations
  has_many :items
end
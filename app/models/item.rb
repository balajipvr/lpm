class Item < ApplicationRecord
  validates :item_name, presence:true, length: {minimum: 3, maximum: 25}, uniqueness: { case_sensitive: false }
  validates :unit_price, presence:true
end

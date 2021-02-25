class OrderItem < ApplicationRecord
belongs_to :order
validates :item_name, presence:true
validates :item_qty, presence:true
validates :unit_price, presence:true
end

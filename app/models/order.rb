class Order < ApplicationRecord
has_many :order_items
belongs_to :customer
accepts_nested_attributes_for :order_items
has_unique_number :invoice_number, generator: :orders, type: :sequential, format: '#y#m#d-%i', start_value: 161, reset: :yearly

scope :customer_name, -> {where ("id = '1'")}
end

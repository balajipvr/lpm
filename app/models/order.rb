class Order < ApplicationRecord
has_many :order_items
accepts_nested_attributes_for :order_items
has_unique_number :invoice_number, generator: :orders, type: :sequential, format: '#y#m#d-%i', start_value: 42, reset: :yearly
end

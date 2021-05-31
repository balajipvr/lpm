class Customer < ApplicationRecord
  validates :company_name, presence:true, length: {minimum: 3, maximum: 100}, uniqueness: { case_sensitive: false }
  has_many :orders
end

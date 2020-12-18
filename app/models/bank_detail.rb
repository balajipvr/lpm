class BankDetail < ApplicationRecord
  validates :account_name, presence:true, length: {minimum: 3, maximum: 30}, uniqueness: { case_sensitive: false }
  validates :account_number, presence:true, length: {minimum: 10, maximum: 25}, uniqueness: { case_sensitive: false }
  validates :ifsc_code, presence:true, length: {minimum: 4, maximum: 25}, uniqueness: { case_sensitive: false }

end

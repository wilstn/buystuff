class Order < ApplicationRecord
  belongs_to :product
  # belongs_to :user
  validates_presence_of :product_id
  validates_presence_of :quantity
  validates_presence_of :total_amount
end

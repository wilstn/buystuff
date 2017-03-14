class Payment < ApplicationRecord
  belongs_to :order

  validates_presence_of :product_id
  validates_presence_of :order_id
  validates_presence_of :quantity
  validates_presence_of :total_amount
  validates_presence_of :email
  validates_presence_of :shipping_address
end

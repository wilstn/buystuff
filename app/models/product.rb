class Product < ApplicationRecord
  has_many :orders

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :remaining_quantity
  validates_presence_of :price

  def update_inventory(quantity)
    self.remaining_quantity -= quantity
    self.save
  end
end

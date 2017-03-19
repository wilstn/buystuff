class Payment < ApplicationRecord
  # has_one :order, through: :cart
  belongs_to :order
end

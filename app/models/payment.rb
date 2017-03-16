class Payment < ApplicationRecord
  has_one :order, through: :cart
end

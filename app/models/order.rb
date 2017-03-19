class Order < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :user

  validates_presence_of :product_id
  validates_presence_of :quantity
  validates_presence_of :total_amount

  def populate_fields(current_user, params)
    self.fill_total_amount
    self.fill_cart_id(params[:cart_id])
    self.fill_user_id(current_user.id)
    self.save
  end

  def fill_total_amount
    self.total_amount = self.quantity * (self.product.price * ENV["discount_rate"].to_f).round(2)
  end

  def fill_cart_id(cart_id)
    self.cart_id = cart_id
  end

  def fill_user_id(user_id)
    self.user_id = user_id
  end

end

class Cart < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_many :products, through: :orders

  def calculate_total
    total = 0
    self.orders.each do |order|
      total += order.total_amount
    end
    total
  end

  # This is called when cart is "checked out" coming from payments#create
  # It saves the individual orders in cart to payments table.
  def save_transactions
    self.orders.each do |order|
      Payment.create(cart_id: self.id, order_id: order.id, user_id: order.user.id)

      order.product.update_inventory(order.quantity)
    end
  end

  def stripe_pay(params)
    Stripe::Charge.create(
        amount: (self.calculate_total*100).to_i,
        currency: "usd",
        source: params[:stripeToken]
      )
  end

end

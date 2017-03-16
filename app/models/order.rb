class Order < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates_presence_of :product_id
  validates_presence_of :quantity
  validates_presence_of :total_amount

  def populate_fields(user_signed_in, params)
    self.fill_total_amount(user_signed_in)
    self.fill_email(params[:stripeEmail])
    self.fill_shipping_address(params)
  end

  def fill_total_amount(user_signed_in)
    product_price = self.product.price * ENV["discount_rate"].to_f if user_signed_in

    self.total_amount = self.quantity * self.product.price.round(2)
  end

  def fill_email(email_params)
    self.email = email_params
  end

  def fill_shipping_address(params)
    self.shipping_address =  "#{params[:stripeShippingName]}\n#{params[:stripeShippingAddressLine1]}\n#{params[:stripeShippingAddressZip]}\n#{params[:stripeShippingAddressState]}\n#{params[:stripeShippingAddressCity]}\n#{params[:stripeShippingAddressCountry]}"
  end

  def stripe_transaction(stripeToken)
    Stripe::Charge.create(
      amount: (self.total_amount*100).to_i,
      currency: "usd",
      source: stripeToken
    )
  end

end

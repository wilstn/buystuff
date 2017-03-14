class Order < ApplicationRecord
  belongs_to :product
  # belongs_to :user
  validates_presence_of :product_id
  validates_presence_of :quantity
  validates_presence_of :total_amount

  def populate_fields(user_signed_in, product_price, params)

    product_price = product_price * 0.85 if user_signed_in

    self.total_amount = self.quantity * product_price

    self.email = params[:stripeEmail]

    self.shipping_address =  "#{params[:stripeShippingName]}\n#{params[:stripeShippingAddressLine1]}\n#{params[:stripeShippingAddressZip]}\n#{params[:stripeShippingAddressState]}\n#{params[:stripeShippingAddressCity]}\n#{params[:stripeShippingAddressCountry]}"
  end

end

class OrdersController < ApplicationController
  def new
    @order = Order.new
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
    @order = @product.orders.new(order_params)

    @order.total_amount = @order.quantity * @product.price # if signed in is 15% discount
    @order.email = params[:stripeEmail]
    @order.shipping_address =  "#{params[:stripeShippingName]}\n#{params[:stripeShippingAddressLine1]}\n#{params[:stripeShippingAddressZip]}\n#{params[:stripeShippingAddressState]}\n#{params[:stripeShippingAddressCity]}\n#{params[:stripeShippingAddressCountry]}"

    Stripe::Charge.create(
      amount: (@order.total_amount*100).to_i,
      currency: "usd",
      source: params[:stripeToken]
    )

    if @order.save
      @product.remaining_quantity = @product.remaining_quantity - @order.quantity
      @product.save
      # UserMailer.sales(@order.email, @product, @order).deliver!
      redirect_to product_path(@product)
    end
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :quantity, :total_amount, :shipping_address, :email, :user_id)
  end
end

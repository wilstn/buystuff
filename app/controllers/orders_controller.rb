class OrdersController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @order = Order.new
  end

  def create
    @product = Product.find(params[:order][:product_id])
    @order = @product.orders.new(order_params)

    @order.cart_id = params[:cart_id]
    @order.user_id = current_user.id
    @order.populate_fields(user_signed_in?, params)
    # @order.stripe_transaction(params[:stripeToken])

    if @order.save
      # @product.update_inventory(@order.quantity)
      # UserMailer.sales(@order.email, @product, @order).deliver!
      redirect_to product_path(@product)
    end
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :quantity, :total_amount, :shipping_address, :email, :user_id)
  end

end

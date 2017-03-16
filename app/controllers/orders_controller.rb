class OrdersController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @order = Order.new
  end

  def create
    @product = Product.find(params[:order][:product_id])
    @order = @product.orders.new(order_params)

    @order.populate_fields(current_user, params)

    redirect_to product_path(@product)
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :quantity, :total_amount, :shipping_address, :email, :user_id)
  end

end

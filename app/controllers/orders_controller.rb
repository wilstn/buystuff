class OrdersController < ApplicationController
  def new
    @order = Order.new
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
    @order = @product.orders.new(order_params)

    if @order.save
      redirect_to new_product_order_payment_path(@product, @order)
    end
  end

  def destroy
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :quantity, :total_amount, :shipping_address, :email, :user_id)
  end
end

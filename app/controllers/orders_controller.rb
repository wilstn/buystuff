class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    redirect_to product_path(@product)
  end

  def destroy
  end

  private

  def order_params
    params.require(:order).permit(:product_id, :quantity, :total_amount, :shipping_address, :email, :user_id)
  end
end

class OrdersController < ApplicationController
  before_action :find_product, only: [:new, :create]

  def new
    @order = Order.new
  end

  def create
    @order = @product.orders.new(order_params)

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

  def find_product
    @product = Product.find(params[:product_id])
  end
end

class PaymentsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @order = Order.find(params[:order_id])
    @payment = Payment.new({:order_id => params[:order_id],
                            :product_id => params[:product_id],
                            :quantity => @order.quantity,
                            :total_amount => @order.total_amount})
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.find(params[:order_id])
    @payment = Payment.new({:order_id => params[:order_id],
                            :product_id => params[:product_id],
                            :total_amount => params[:payment][:total_amount],
                            :quantity => params[:payment][:quantity],
                            :shipping_address => params[:payment][:shipping_address],
                            :email => params[:stripeEmail]
                          })

    Stripe::Charge.create(
      amount: (@order.total_amount*100).to_i,
      currency: "usd",
      source: params[:stripeToken]
    )

    if @payment.save
      @product.remaining_quantity = @product.remaining_quantity - @order.quantity
      @product.save

      @user_email = @payment.email

      UserMailer.sales(@user_email, @product, @order).deliver!
      redirect_to products_path
    end
  end

  # private
  #
  # def payment_params
  #   params.require(:payment).permit(:product_id, :quantity, :total_amount, :shipping_address, :email, :user_id)
  # end
end

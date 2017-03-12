class PaymentsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @order = Order.find(params[:order_id])
    @payment = Payment.new({:order_id => params[:order_id], :product_id => params[:product_id]})
    @payment.quantity = Order.find(params[:order_id]).quantity
    @payment.total_amount = Order.find(params[:order_id]).total_amount
  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.find(params[:order_id])
    @payment = Payment.new({:order_id => params[:order_id],
                            :product_id => params[:product_id],
                            :total_amount => params[:payment][:total_amount],
                            :quantity => params[:payment][:quantity],
                            :shipping_address => params[:payment][:shipping_address],
                            :email => params[:payment][:email]
                            # :email => stripe_email
                          })
    # stripe_email = params[:stripeEmail]

    # Stripe::Charge.create(
    #   amount: @order.total_amount*100,
    #   currency: "sgd",
    #   source: params[:stripeToken]
    # )

    if @payment.save
      @product.remaining_quantity = @product.remaining_quantity - @order.quantity
      @product.save
      redirect_to products_path
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:product_id, :quantity, :total_amount, :shipping_address, :email, :user_id)
  end
end

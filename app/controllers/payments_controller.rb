class PaymentsController < ApplicationController
  def new
  end

  def create
    @cart = Cart.find_by(user_id: current_user.id)
    @cart.stripe_pay(params[:stripeToken])
    @cart.save_transactions
    @cart.destroy
    redirect_to products_path
  end
end

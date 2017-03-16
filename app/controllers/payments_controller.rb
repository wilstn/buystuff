class PaymentsController < ApplicationController

  def create
    @cart = Cart.find_by(user_id: current_user.id)

    begin
      # @cart.stripe_pay(params)
      blah.hello
    rescue
      flash[:notice] = "Transaction failed"
    else
      @cart.save_transactions
      @cart.destroy
      flash[:notice] = "Thanks for buying"
    end

    redirect_to products_path
  end

end

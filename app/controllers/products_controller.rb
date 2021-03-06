class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.page(params[:page]).per(9)

    if user_signed_in?
      @cart = find_cart ? find_cart : Cart.create(user_id: current_user.id)
    end
  end

  def show
    @order = Order.new

    if user_signed_in?
      @cart = find_cart ? find_cart : Cart.create(user_id: current_user.id)
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :remaining_quantity, :product_image)
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def find_cart
    Cart.find_by(user_id: current_user.id)
  end
end

class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(10)
  end

  def show
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
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :remaining_quantity, :product_image)
  end
end

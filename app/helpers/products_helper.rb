module ProductsHelper
  def applied_price (product)
    user_signed_in? ? (product.price * 0.85).round(2) : product.price
  end
end

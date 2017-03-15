module ProductsHelper
  def applied_price (product)
    user_signed_in? ? (product.price * ENV["discount_rate"].to_f).round(2) : product.price
  end
end

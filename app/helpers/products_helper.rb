module ProductsHelper
  def discount_price (product)
    (product.price * ENV["discount_rate"]).to_f.round(2)
  end

  def full_price (product)
    product.price
  end
end

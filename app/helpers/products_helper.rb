module ProductsHelper
  def discount_price (product)
    (product.price * ENV["discount_rate"].to_f).to_f.round(2)
  end

  def full_price (product)
    product.price
  end

  def discount_if_logged_in(user_signed_in)
    usual_price = "<p id='product-price'><span class='dollar'>#{ full_price(@product) } </span></p>"
    logged_in_price = "<p>UP: <strike><span class='dollar'>#{ full_price(@product) }</span></strike></p>
                      <p id='product-price'><span class='dollar'>#{ discount_price(@product) }</span></p>"

    user_signed_in ? logged_in_price : usual_price
  end
end

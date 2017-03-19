class UserMailer < ApplicationMailer
  default from: 'betacampz@gmail.com'

  # def sales(user_email, product, order)
  #   @product = product
  #   @order = order
  #   mail(to: user_email, subject: 'Successful transaction')
  # end

  def top_product_email(product, email_address)
    @product_1_name, @product_1_qty = product[0]
    @product_2_name, @product_2_qty = product[1]
    mail(to: email_address, subject: 'Top product')
  end
end

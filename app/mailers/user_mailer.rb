class UserMailer < ApplicationMailer
  default from: 'betacampz@gmail.com'

  def sales(user_email, product, order)
    @product = product
    @order = order
    mail(to: user_email, subject: 'Successful transaction')
  end
end

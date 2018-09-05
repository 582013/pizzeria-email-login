class OrderMailer < ApplicationMailer
  # defaul from: "pizzeria@chronicle.com"
  default from: "zerodng@yahoo.com"
  
  
  def order_confirmation(order)
    @order = order
    mail to: order.email, subject: "Order Confirmation"
  end

   def welcome_email
    # @user = params[:user]
    # @url  = 'http://example.com/login'
    mail(to: @order.email, subject: 'Welcome to My Awesome Site')
  end
end

class UserMailer < ApplicationMailer
  default from: ENV['SENDGRID_FROM']

  def welcome_email(user)
    # Setting @user to use it in the welcome_email view
    @user = user
    # We set the @url variable by getting the environment variable (url of our website)
    @url  = ENV['SENDGRID_HOSTNAME']

    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def order_delivery_email
    @order = params[:order]
    puts '#' * 40
    puts @order.id
    puts @order.items.size
    puts '=' * 80
    puts @order.inspect
    puts '=' * 80
    @user = @order.user
    @url  = ENV['SENDGRID_HOSTNAME']

    mail(to: @user.email, subject: 'Voici votre commande')
  end

  #  def order_delivery_email(user)
  #    @user = user
  #    @order = @user.orders.last
  #    @url  = ENV['SENDGRID_HOSTNAME']
  #
  #    mail(to: @user.email, subject: 'Voici votre commande')
  #  end
end

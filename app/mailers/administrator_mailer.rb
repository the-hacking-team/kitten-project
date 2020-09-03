class AdministratorMailer < ApplicationMailer
  default from: ENV['SENDGRID_FROM']

  def sum_up_sale_email
    @administrator = params[:administrator]
    @order = params[:order]
    @user = @order.user
    @order_amount = params[:order_amount]
    @url  = ENV['SENDGRID_HOSTNAME']
    mail(to: @administrator.email, subject: 'Félicitations ! Vous avez une nouvelle vente !')
  end

end

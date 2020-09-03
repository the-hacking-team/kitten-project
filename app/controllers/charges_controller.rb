class ChargesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    # Warning : add this in the routes file if you want to use it
  end

  def create
    @user = current_user
    @cart = @user.cart
    @order_amount = @user.cart.total_price
    # Amount in cents
    @amount_stripe = (@order_amount * 100).to_i

    # A Stripe object Customer is created : custumer.id is generated and can be re-used for the same customer
    customer = Stripe::Customer.create({
                                         email: params[:stripeEmail],
                                         source: params[:stripeToken]
                                       })

    charge = Stripe::Charge.create({
                                     customer: customer.id,
                                     amount: @amount_stripe,
                                     description: "Paiement de #{@user.email}",
                                     currency: 'eur'
                                   })

    # Order creation
    # ---------------
    @order = Order.create(user_id: @user.id)
    @cart.items.each do |item|
      OrderItem.create(order_id: @order.id, item_id: item.id)
    end

    # Deliver the order to the user
    # ------------------------------
    # See https://stackoverflow.com/questions/8709984/how-to-catch-error-exception-in-actionmailer
    begin
      UserMailer.with(order: @order, order_amount: @order_amount).order_delivery_email.deliver_now
    rescue Exception => e
      puts 'ERROR: order_delivery_email'
      # FIXME: can't see notice
      flash[:notice] = "Il y a eu un problème dans l'envoi du mail, merci de nous contacter"
    end

    # Sending an email to each administrator
    # --------------------------------------
    @administrators = Administrator.all
    @administrators.each do |admin|
      begin
      AdministratorMailer.with(order: @order, administrator: admin, order_amount: @order_amount).sum_up_sale_email.deliver_now
      rescue Exception => e
        puts 'ERROR: sum_up_sale_email'
      end
    end


    # FIXME: check if necessary?
    # Destroy cart
    @cart.cart_items.destroy_all
    # Is it necessary Mathieu Voland?
    @cart.items.destroy_all
    # puts 'AFTER DESTROY'
    # puts '#' * 80
    # puts @cart.cart_items.inspect
    # puts @cart.items.inspect
    # puts '#' * 80
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to cart_path
  end
end

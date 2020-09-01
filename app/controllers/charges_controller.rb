class ChargesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    ### @order = Order.find(params[:order_id])

    # If something is creater we can add : @something = Something.new

    # Amount in cents
    ### @amount = @order.price*100  # if order.price is not in cents
    @order_amount = 5 
    @amount = @order_amount * 100
    # We go now in the new.html.erb form : to pay the amount !
  end
  
  def create
    ### @order = Order.find(params[:order_id])
    ### @amount = @order.price*100  # in cents 

    @user = current_user
    ### puts "#{@user.email} vous cherchez à payer votre commande #{@order.id} qui coute #{@order.price}"
    # Amount in cents
    @order_amount = 5 
    @amount = @order_amount * 100
    puts "#{@user.email} vous cherchez à payer votre commande qui coute #{@order_amount} €"

    # A Stripe object Customer is created : custumer.id is generated and can be re-used for the same customer
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: "Paiement de #{@user.email}",
      currency: 'eur',
    })
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end

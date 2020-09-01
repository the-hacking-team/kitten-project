class CartsController < ApplicationController
before_action :authenticate_user!

  #Find the Cart whose User ID is current_user.id
  #Get Cart Params Id
  def show
    @cart = Cart.find(params[:id])
    if @cart.user != current_user
      flash[:notice] = "Panier d'un autre utilisateur"
      redirect_to root_path
    end
    @items = @cart.items
    @user = current_user
  end

  def update
    puts params
    @cart = Cart.find(params[:id])
    if @cart.user != current_user
      flash[:notice] = "Panier d'un autre utilisateur"
      redirect_to root_path
    end
    @items = Item.find(params[:item_id])

    # road to the link to the button "add to cart" : cart_path(current_user.cart) method: put 
  end

  def destroy
  end
end

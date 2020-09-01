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
    @cart = Cart.where(user_id: current_user.id).last
    if @cart.user != current_user
      flash[:notice] = "Panier d'un autre utilisateur"
      redirect_to root_path
    end
    @item = Item.find(params[:item_id])      
    @my_cart_item = CartItem.create(cart_id: current_user.cart.id, item_id: @item.id)
    redirect_to root_path
    # road to the link to the button "add to cart" : cart_path(current_user.cart) method: put 
  end

  def destroy
  end
end

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

    @cart_items = CartItem.where(cart_id: @cart.id)
    
    @total = 0
    @cart_items.each do |cart_item|
      @total += cart_item.item.price
    end
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
    @cart = Cart.where(user_id: current_user.id).last
    @cart_item2 = CartItem.find_by(cart_id: @cart.id, item_id: params[:item_id])
    @cart_item2.destroy

    puts params[:item_id]
    redirect_to cart_path(params[:id])
  end


  private 


end

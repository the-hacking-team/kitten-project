class CartsController < ApplicationController
  before_action :authenticate_user!

  # Find the Cart whose User ID is current_user.id
  # Get Cart Params Id
  def show
    @cart = Cart.find(params[:id])
    check_cart_belongs_to_current_user
    @items = @cart.items
    @user = current_user

    @cart_items = CartItem.where(cart_id: @cart.id)

    @total = 0
    @cart_items.each do |cart_item|
      @total += cart_item.item.price
    end
  end

  def update
    @cart = Cart.find(params[:id])
    check_cart_belongs_to_current_user
    @item = Item.find(params[:cart][:item_id])
    if @cart.items.include?(@item)
      flash[:notice] = 'Déjà dans le panier'
    else
      flash[:notice] = 'Bien ajouté au panier'
      CartItem.create(cart_id: @cart.id, item_id: @item.id)
    end
    redirect_to request.referrer
  end

  def destroy
    @cart = Cart.where(user_id: current_user.id).last
    @cart_item2 = CartItem.find_by(cart_id: @cart.id, item_id: params[:item_id])
    @cart_item2.destroy

    puts params[:item_id]
    redirect_to cart_path(params[:id])
  end

  private

  def check_cart_belongs_to_current_user
    if @cart.user != current_user
      flash[:alert] = "Panier d'un autre utilisateur"
      redirect_to root_path
    end
  end
end

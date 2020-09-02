class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = Cart.find(params[:id])
    @amount_stripe = (@cart.total_price*100).to_i
    check_cart_belongs_to_current_user
  end

  def update
    @cart = Cart.find(params[:id])
    check_cart_belongs_to_current_user
    @item = Item.find(params[:cart][:item_id])
    if @cart.items.include?(@item)
      flash[:alert] = 'Déjà dans le panier'
    else
      flash[:notice] = 'Bien ajouté au panier' if CartItem.create(cart_id: @cart.id, item_id: @item.id)
    end
    redirect_to request.referrer
  end

  def destroy
    @cart = Cart.find(params[:id])
    check_cart_belongs_to_current_user
    @cart_item = CartItem.find_by(cart_id: @cart.id, item_id: params[:item_id])
    flash[:notice] = 'Bien supprimé panier' if @cart_item.destroy

    redirect_to request.referrer
  end

  private

  def check_cart_belongs_to_current_user
    if @cart.user != current_user
      flash[:alert] = 'Accès interdit'
      redirect_to root_path
    end
  end
end

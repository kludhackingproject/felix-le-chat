class DestroyCartItemsController < ApplicationController

  def create
    @cart = Cart.find(cart_id)
    @cart.items << Item.find(params[:id])
    redirect_to root_path
    flash[:success] = "Photo ajoutée au panier"
  end



  def destroy
    @item = Cart.find(cart_id).join_table_cart_items.where(item_id: params[:id]).first
    @item.destroy
    flash[:success] = "Article retiré !"
    redirect_to cart_path(cart_id)
  end

end

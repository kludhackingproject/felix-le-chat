class DestroyCartItemsController < ApplicationController
  def destroy
    @item = Cart.find(cart_id).join_table_cart_items.where(item_id: params[:id]).first
    @item.destroy
    flash[:success] = "Panier vidé !"
    redirect_to cart_path(cart_id)
  end
end

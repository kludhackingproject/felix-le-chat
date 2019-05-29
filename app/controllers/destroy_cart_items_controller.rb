class DestroyCartItemsController < ApplicationController

  def create
    @addingitem = JoinTableCartItem.new(cart_id: Cart.find(cart_id), item_id: params[:id])
  
    if @addingitem.save
      render "/"
    end 

  end 

  
  
  def destroy
    @item = Cart.find(cart_id).join_table_cart_items.where(item_id: params[:id]).first
    @item.destroy
    flash[:success] = "Panier vidé !"
    redirect_to cart_path(cart_id)
  end
end

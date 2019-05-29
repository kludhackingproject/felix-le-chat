class DestroyCartItemsController < ApplicationController

  def create
    @cart = Cart.find(cart_id)
    @cart.items << Item.find(params[:id])
    redirect_to root_path
  end



  def destroy
    @item = Cart.find(cart_id).join_table_cart_items.where(item_id: params[:id]).first
    @item.destroy
    flash[:success] = "Article retiré !"
    redirect_to cart_path(cart_id)
  end

def create
    @addingitem = JoinTableCartItem.new(cart_id: Cart.find(cart_id), item_id: params[:id])
  
    if @addingitem.save
      render "/"
    end 


  end
end

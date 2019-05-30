class ProfilesController < ApplicationController

  def show
    @user = User.friendly.find(params[:id])
  	@user_orders = @user.orders
  	@user_cart = @user.cart
  end
  
end

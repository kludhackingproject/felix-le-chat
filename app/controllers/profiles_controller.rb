class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
  	@user_orders = @user.orders
  	@user_cart = @user.cart
  end
end

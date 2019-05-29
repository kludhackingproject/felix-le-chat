class OrdersController < ApplicationController
    def index
    end

    def show
    end 

    def new
    end 

    def create
        @order = Order.create(user_id: current_user.id)
        
        current_cart = Cart.find(cart_id).items
        current_cart.each do |item|
            JoinTableOrderItem.create(order_id: @order.id, item_id: item.id)
        end

    end

    def edit 
    end

end

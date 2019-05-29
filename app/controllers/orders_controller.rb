class OrdersController < ApplicationController
    def index
    end

    def show
    end 

    def new
    end 

    def create
        @order = Order.new(user_id: current_user.id)
        
        current_cart = Cart.find(cart_id).items
        current_cart.each do |item|
            JoinTableOrderItem.create(order_id: self.id, item_id: item.id)
        end

        if @order.save
            redirect_to items_path
            current_cart.destroy_all 
        end

    end

    def edit 
    end

end

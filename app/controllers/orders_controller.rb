class OrdersController < ApplicationController
    def index
    end

    def show
    end 

    def new
    end 

    def create
        @order = Order.new(user_id: 19)
        current_cart = Cart.find(5)
        items = current_cart.items
        @order.items = items
        if @order.save
            redirect_to items_path
            alert[:success] = "Votre commande a bien été enregistré"
        else 
            render cart_path(:id => 7)
        end
    end

    def edit 
    end

end

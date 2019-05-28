class OrderController < ApplicationController
    def index
    end

    def show
    end 

    def new
    end 

    def create
        @order = Order.new(user_id: current_user.id)
        current_cart = Cart.find_by(user_id: current_user.id)
        items = current_cart.items
        @order.items = items
        if @order.save
            redirect_to "/"
            alert[:success] = "Votre commande a bien été enregistré"
        else 
            render "new"
        end
    end
    end 

    def edit 
    end

    def 
end

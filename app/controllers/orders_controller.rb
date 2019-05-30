class OrdersController < ApplicationController
    def index
    end

    def show
    end

    def new
      @cart = Cart.find(cart_id)
      @amount = @cart.sub_total * 100
    end

    def create
      @cart = Cart.find(cart_id)
      @amount_cent = @cart.sub_total
      @amount = @amount_cent * 100

      current_cart_array = Cart.find(cart_id).items

      @order = Order.new(user_id: current_user.id, stripe_token: params[:stripeToken])

      begin
        customer = Stripe::Customer.create({
          email: params[:stripeEmail],
          source: params[:stripeToken],
        })

        charge = Stripe::Charge.create({
          customer: customer.id,
          amount: @amount.to_i,
          description: 'Felix le chat customer',
          currency: 'EUR',
        })

      rescue Stripe::CardError => e
        flash[:error] = e.message
      end

      if @order.save # essaie de sauvegarder en base @order
        # si ça marche, il redirige vers la page d'index du site
        current_cart_array.each do |item|
          JoinTableOrderItem.create(order_id: @order.id, item_id: item.id)
        end
        current_cart_array.destroy_all
        redirect_to root_path
      else
        # sinon, il render la view new (qui est celle sur laquelle on est déjà)
        redirect_to cart_path(:id => cart_id)
      end
    end

    def edit
    end
end

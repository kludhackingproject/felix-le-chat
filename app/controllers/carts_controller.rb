class CartsController < ApplicationController
  before_action :authenticate_user!


# pas besoin, un seul panier par personne
  def index
  end

  def new
    @cart = Cart.new
  end

# panier avec tous les items, lié au user_id
  def show
    @cart = Cart.find(cart_id)

    @amount = @cart.sub_total * 100

    @cart_items = @cart.items
  end

  def create
    @addingitem = JoinTableCartItem.add(LineItem.new(cart_id: Cart.find(cart_id), item_id: params[:id]))
  end

  # cherche l'item dans le panier
  def edit

  end

# vider le panier pour passer commande
  def destroy

  end

# supprimer l'item sélectionné dans le panier
# méthode .delete, chercher l'id du produit lié au bouton "supprimer" cliqué
  def update
  end
end

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
    @cart_items = @cart.items
  end

  def create

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

# calculer le total du panier en additionant le prix des items
  def calculate_total
    @cart = Cart.find(params[:id])
    cart_price = 0
    # boucle pour incrémenter la valeur de price à chaque item ajouté
    # chercher le nombre d'items du panier
    @cart.items.each do |item|
      cart_price += item.price
    end
  end

end

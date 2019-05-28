class CartsController < ApplicationController
  before_action :authenticate_user

  def authenticate_user
    unless logged_in?
      flash[:danger] = "Veuillez vous authentifier"
      redirect_to new_session_path
    end
  end

# pas besoin, un seul panier par personne
  def index
  end

# panier avec tous les items, lié au user_id
  def show
    @cart = Cart.items
  end

# vider le panier pour passer commande
  def destroy
    Cart.find(params[:id]).destroy
    flash[:success] = "Panier vidé !"
    redirect_to order_show_path
  end

  def new
    @cart = Cart.new
  end

  def create
  end

# cherche l'item dans le panier
  def edit
    @item = Item.find(params[:id])
  end

# supprimer l'item sélectionné dans le panier
# méthode .delete, chercher l'id du produit lié au bouton "supprimer" cliqué
  def update
    # 
  end


# calculer le total du panier en additionant le prix des items
  def calculate_total
    cart_price = 0
    # boucle pour incrémenter la valeur de price à chaque item ajouté
    # chercher le nombre d'items du panier
    @cart.items.each do |item|
      cart_price += item_price
    end
  end

end

class Order < ApplicationRecord
    after_create :order_send

    belongs_to :user
    belongs_to :cart
    has_many :join_table_order_items
    has_many :items, through: :join_table_order_items

    validates :user_id, presence: true
    validates :stripe_token, presence: true

    
  # Envoyer un e-mail à l'utilisateur lors de la validation d'une commande

  #def order_send
<<<<<<< HEAD
  #  UserMailer.order_confirmation(self).deliver_now
  #end
=======
   # UserMailer.order_confirmation(self).deliver
  #end

   def sub_total
      sum = 0
      self.items.each do |item|
        sum += item.price
      end
    return sum
  end

  def order_send
    UserMailer.order_confirmation(self).deliver
  end
>>>>>>> 656409df1a88aa88047409260fec137190f5afda
  
end

class UserMailer < ApplicationMailer
    default from: 'bonjour@felixlechat.fr'
    
    def welcome_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user 
  
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'projet-felix-le-chat.herokuapp.com/login' 
  
      #c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: 'Bienvenue chez Felix Le Chat !') 
    end

    def order_confirmation(user, order)
        @user = user
        @order = order
        @item = item
        mail(to: @user.email, subject: 'La commande a été reçue')
    end
end
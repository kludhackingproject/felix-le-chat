class UserMailer < ApplicationMailer
    default from: 'aj.antoinejacques@protonmail.com'
    
    def welcome_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user 
  
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'http://projet-felix-le-chat.herokuapp.com' 
  
      #c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: 'Bienvenue chez Felix Le Chat !') 
    end
    
    def order_confirmation(user)
      
      @user = user

      mail(to: @user.email, subject: 'La commande a été reçue')
    end

    #def welcome_recap
    # @user = user
     # mail(to: @user.last.email, subject: "#{@user.first_name} #{@user.last_name} s'est inscrit")
   # end
end
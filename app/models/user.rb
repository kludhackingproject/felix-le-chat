class User < ApplicationRecord
  after_create :create_cart
  after_create :welcome_send

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart
  has_many :orders

  validates :first_name, presence: true, length: { in: 0..20 }
  validates :last_name, presence: true, length: { in: 0..20 }
  validates :description, presence: true, length: { in: 6..200 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  
  # Envoyer un e-mail à l'utilisateur lors de la création de son compte
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  private


  # Créer un Cart lors de la création d'un utilisateur
  def create_cart
    Cart.create(user_id: self.id)
  end
end

class User < ApplicationRecord
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
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  # Envoyer un e-mail à l'utilisateur lors de la validation d'une commande
  after_create :order_send

  def order_send
    UserMailer.order_confirmation(self, order).deliver
  end

end

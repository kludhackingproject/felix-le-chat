class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

<<<<<<< HEAD
  # has_one: :cart
  # has_many: :orders
=======
  has_one: :cart
  has_many: :orders
>>>>>>> dev-vincent

  validates :first_name, presence: true, length: { in: 0..20 }
  validates :last_name, presence: true, length: { in: 0..20 }
  validates :description, presence: true, length: { in: 6..200 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
end

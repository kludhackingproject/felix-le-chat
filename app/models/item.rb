class Item < ApplicationRecord
    validates :title, presence: true
    validates :price, presence: true, numericality: true
    validates :image_url, presence: true

   has_many :join_table_cart_items
   has_many :carts, through: :join_table_cart_items
   has_many :join_table_order_items
   has_many :orders, through: :join_table_order_items

	extend FriendlyId
	friendly_id :title, use: :slugged
end

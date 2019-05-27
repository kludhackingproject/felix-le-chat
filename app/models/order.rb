class Order < ApplicationRecord
    belongs_to :user, 
    has_many :join_table_order_items
    has_many :items, through: :join_table_order_items

    validates :user_id, presence: true
end

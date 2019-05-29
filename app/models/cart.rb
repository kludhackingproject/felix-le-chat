class Cart < ApplicationRecord
    belongs_to :user
    has_many :join_table_cart_items
    has_many :items, through: :join_table_cart_items

    validates :user_id, presence: true, uniqueness: true

    def sub_total
      sum = 0
      self.items.each do |item|
        sum += item.price
      end
    return sum
  end
end

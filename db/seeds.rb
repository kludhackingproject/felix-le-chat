# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#Destruction des Users, Items, Orders, Carts, Join Table Order Item et Join_Table_Cart_Item
print "-"*10, "Beginning seed", "-"*10,"\n"
puts "Emptying all tables"
User.destroy_all
Item.destroy_all
Order.destroy_all
Cart.destroy_all
JoinTableOrderItem.destroy_all
JoinTableCartItem.destroy_all
puts "All tables are empty"

#Création des Users
puts "Creating users"
25.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence(3),
    email: "#{Faker::Name.first_name}@yopmail.com",
    password: "thp_test"
  )
end
puts "done"

#Création des Items
puts "Creating Items"
20.times do 
    Item.create(
        title: Faker::FunnyName.name,
        description: Faker::TvShows::HowIMetYourMother.quote,
        price: Faker::Commerce.price(range = 0..100.0, as_string = true),
        image_url: Rails.root.join("app/assets/images/Cat_picture.jpg").open
    )
end
puts "done"

#Création des Orders
puts "Creating Orders"
20.times do 
    Order.create(
        user_id: User.all.sample.id
    )
end
puts "done"

#Création des Cart
puts "Creating CartS"
40.times do 
    Cart.create(
        user_id: User.all.sample.id
    )
end
puts "done"

#Création des Join Table Order Items
puts "Creating Join_Table_Order_Items"
20.times do 
    JoinTableOrderItem.create(
        order_id: Order.all.sample.id,
        item_id: Item.all.sample.id
    )
end
puts "done"

#Création des Join Table Cart Items
puts "Creating Join_Table_Cart_Items"
20.times do 
    JoinTableCartItem.create(
        cart_id: Cart.all.sample.id,
        item_id: Item.all.sample.id    
    )
end
puts "done"

#On indique le nombre de User, Item, Order, Cart, Join_Table_Order_Item et Creating Join_Table_Cart_Item généré 
print "-"*10, "Displaying tables count", "-"*10,"\n"
puts "User.count : #{User.count}"
puts "Item.count : #{Item.count}"
puts "Order.count : #{Order.count}"
puts "Cart.count : #{Cart.count}"
puts "Join_Table_Order_Item.count : #{JoinTableOrderItem.count}"
puts "Creating Join_Table_Cart_Item : #{JoinTableCartItem.count}"

print "-"*10, "Seed is done", "-"*10, "\n"
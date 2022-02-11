# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Item.destroy_all

ryan = User.create!(
    username: 'ryan_the_goat',
    email: 'ry@email.com',
    country: 'USA',
    age: 32,
    password: 'abc123'
)

benny = User.create!(
    username: 'ben_benassi',
    email: 'get_benjamins@email.com',
    country: 'Italy',
    age: 54,
    password: 'password'
)

ivan = User.create!(
    username: 'ivan_the_terrible',
    email: 'ivanemail@email.com',
    country: 'Russia',
    age: 10,
    password: '654321'
)

paulo = User.create!(
    username: 'paulito',
    email: 'bocanegra_grande@gmail.com',
    country: 'Peru',
    age: 28,
    password: 'password123'
)

Item.create!(
    product_name: 'Sandbag',
    product_description: 'Heavy cuz of the sand',
    price: 49.99,
    seller_id: ryan.id
)

Item.create!(
    product_name: 'Shovel',
    product_description: 'Digs real good ',
    price: 109.99,
    seller_id: ryan.id
)

Item.create!(
    product_name: 'Binocular',
    product_description: 'You can see over 1000 ft away!',
    price: 12.99,
    seller_id: benny.id
)

Item.create!(
    product_name: 'Book of matches',
    product_description: 'They even work when wet',
    price: 0.99,
    seller_id: ivan.id
)

Item.create!(
    product_name: 'Cup of dirt',
    product_description: 'Its a cup...with dirt in it',
    price: 999.99,
    seller_id: paulo.id
)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Card.create(name:'Citi Double Cash Card', annual_fee: 0.00, card_type:'cashback', other_cash_rate:2.00)
Card.create(name:'Capital One Quicksilver', annual_fee: 0.00, card_type:'cashback', other_cash_rate:1.50)
Spent.create(spend: 100)

=begin
t.string :name
t.string :description
t.string :type
t.string :logo_url
t.integer :signup_bonus_spend_required
t.integer :signup_bonus_points_earned
t.float :annual_fee
t.integer :gas_points_multi
t.integer :gas_points_limit
t.integer :gas_points_multi_limit
t.integer :grocery_points_multi
t.integer :grocery_points_limit
t.integer :grocery_points_multi_limit
t.integer :dining_point_multi
t.integer :dining_points_limit
t.integer :dining_points_multi_limit
t.integer :hotel_points_multi
t.integer :hotel_points_limit
t.integer :hotel_points_multi_limit
t.integer :airfare_points_multi
t.integer :airfare_points_limit
t.integer :airfare_points_multi_limit
t.integer :other_points_multi
t.integer :other_points_limit
t.integer :other_points_multi_limit
t.float :point_value
t.integer :sign_up_bonus_cash
t.float :gas_cash_rate
t.integer :gas_cash_limit
t.float :gas_cash_multi_limit
t.float :grocery_cash_rate
t.integer :grocery_cash_limit
t.float :grocery_cash_multi_limit
t.float :dining_cash_rate
t.integer :dining_cash_limit
t.float :dining_cash_multi_limit
t.float :hotel_cash_rate
t.integer :hotel_cash_limit
t.float :hotel_cash_multi_limit
t.float :airfare_cash_rate
t.integer :airfare_cash_limit
t.float :airfare_cash_multi_limit
t.float :other_cash_rate
t.integer :other_cash_limit
t.float :other_cash_multi_limit
=end

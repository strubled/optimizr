class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :description
      t.string :card_type
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

      t.timestamps
    end
  end
end

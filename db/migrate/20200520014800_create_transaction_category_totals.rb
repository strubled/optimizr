class CreateTransactionCategoryTotals < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_category_totals do |t|
      t.integer :grocery
      t.integer :gas
      t.integer :hotel
      t.integer :dining
      t.integer :airfare
      t.integer :amazon
      t.integer :other
      t.integer :total
      t.references :user, index: true, foreign_key: true
      t.timestamps null:false
    end
    add_index :transaction_category_totals, [:user_id, :created_at]
  end
end

class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.integer :grocery
      t.integer :gas
      t.integer :dining
      t.integer :amazon
      t.integer :hotel
      t.integer :airline
      t.integer :other
      t.integer :total
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

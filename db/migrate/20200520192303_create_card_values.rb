class CreateCardValues < ActiveRecord::Migration[6.0]
  def change
    create_table :card_values do |t|
      t.integer :grocery
      t.integer :gas
      t.integer :hotel
      t.integer :dining
      t.integer :airline
      t.integer :amazon
      t.integer :other
      t.integer :total

      t.timestamps
    end
  end
end

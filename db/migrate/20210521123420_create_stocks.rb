class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.float :stock_price
      t.string :asset_type

      t.timestamps
    end
  end
end

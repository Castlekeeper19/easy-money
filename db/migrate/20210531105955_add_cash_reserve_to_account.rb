class AddCashReserveToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :cash_reserve, :float
  end
end

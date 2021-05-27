class AddGainToHolding < ActiveRecord::Migration[6.0]
  def change
    add_column :holdings, :gain, :float
  end
end

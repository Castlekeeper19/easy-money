class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :type
      t.float :balance

      t.timestamps
    end
  end
end

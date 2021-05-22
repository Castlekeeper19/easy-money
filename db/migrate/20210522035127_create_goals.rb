class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :name
      t.float :goal_amount
      t.float :goal_balance, default: 0.0
      t.date :end_date
      t.boolean :completed, default: false
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class RenameTypeToAccountType < ActiveRecord::Migration[6.0]
  def change
    rename_column :accounts, :type, :account_type
  end
end

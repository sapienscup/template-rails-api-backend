class ChangeTableNameUsersToAccounts < ActiveRecord::Migration[6.1]
  def change
    rename_table :users, :accounts
  end
end

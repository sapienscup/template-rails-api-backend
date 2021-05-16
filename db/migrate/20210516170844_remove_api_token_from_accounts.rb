class RemoveApiTokenFromAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :api_token
  end
end

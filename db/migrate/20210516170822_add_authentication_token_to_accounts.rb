class AddAuthenticationTokenToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :authentication_token, :string, limit: 30
    add_index :accounts, :authentication_token, unique: true
  end
end

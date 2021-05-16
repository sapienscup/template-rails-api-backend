class AddAdminRefToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_reference :accounts, :admin, foreign_key: true
  end
end

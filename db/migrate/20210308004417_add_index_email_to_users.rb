class AddIndexEmailToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, unique: true
    add_index :users, :api_token, unique: true
  end
end

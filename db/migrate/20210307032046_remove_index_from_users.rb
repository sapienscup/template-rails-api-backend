class RemoveIndexFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_index :users, :pseudo
  end
end

class RemovePseudoFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :pseudo
  end
end

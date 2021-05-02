class AddIndexToGroups < ActiveRecord::Migration[6.1]
  def change
    add_index :groups, :code, unique: true
  end
end

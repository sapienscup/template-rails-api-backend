class AddDeletedAtToProfiles < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :deleted_at, :datetime
  end
end

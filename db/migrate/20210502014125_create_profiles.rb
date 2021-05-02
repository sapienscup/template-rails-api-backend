class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :group
      t.references :account
      t.timestamps
    end
  end
end

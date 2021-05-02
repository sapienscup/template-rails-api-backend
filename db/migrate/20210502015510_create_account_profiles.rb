class CreateAccountProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :account_profiles do |t|
      t.references :account
      t.references :profile
      t.timestamps
    end
  end
end

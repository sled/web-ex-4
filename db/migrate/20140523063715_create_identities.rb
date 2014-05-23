class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user, index: true
      t.string :provider
      t.string :uid
      t.string :nickname
      t.string :token
      t.string :secret
      t.string :name

      t.timestamps
    end
  end
end

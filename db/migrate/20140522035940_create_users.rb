class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :location
      t.string :email, null: false
      t.string :confirmation_token, limit: 128
      t.string :encrypted_password, null: false,   limit: 128
      t.string :remember_token,     null: false,   limit: 128 

      t.timestamps
      
      t.index [:email, :encrypted_password]
      t.index :remember_token
    end
  end
end

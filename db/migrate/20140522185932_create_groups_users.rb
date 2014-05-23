class CreateGroupsUsers < ActiveRecord::Migration
  def change
    create_table :groups_users, id: false do |t|
      t.references :group
      t.references :user 

      t.index [:group_id, :user_id], unique: true
      t.index :user_id
    end
  end
end

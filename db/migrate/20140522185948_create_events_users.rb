class CreateEventsUsers < ActiveRecord::Migration
  def change
    create_table :events_users, id: false do |t|
      t.references :event 
      t.references :user
      t.index [:event_id, :user_id], unique: true
      t.index :user_id
    end
  end
end

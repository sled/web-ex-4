class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.references :owner
      t.string :name, limit: 50
      t.string :hometown, limit: 50
      t.timestamps
    end
  end
end

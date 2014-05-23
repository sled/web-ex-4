class RenameFixedAtToConfirmedAt < ActiveRecord::Migration
  def change
    rename_column :events, :fixed_at, :confirmed_at
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :group

      t.string    :name, limit: 50
      t.string    :location
      t.datetime  :start_date
      t.string    :duration, limit: 50
      t.text      :description
      t.integer   :fixed_at

      # photo stuff
      t.string  :photo_id
      t.string  :photo_author
      t.string  :photo_profile_url
      t.string  :cached_thumb_url
      t.string  :cached_photo_url

      t.timestamps
    end
  end
end

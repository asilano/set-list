class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :original_artist
      t.string :aka
      t.boolean :georgie_main
      t.boolean :chris_main
      t.boolean :backing_vocals
      t.boolean :lead_guitar
      t.string :key
      t.string :genre
      t.string :speed
      t.text :notes

      t.timestamps null: false
    end
  end
end

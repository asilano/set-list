class CreateSongInstances < ActiveRecord::Migration
  def change
    create_table :song_instances do |t|
      t.references :song, index: true, foreign_key: true
      t.references :gig_set, index: true, foreign_key: true
      t.integer :order

      t.timestamps null: false
    end
  end
end

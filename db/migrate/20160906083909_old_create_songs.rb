class OldCreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.text :title

      t.timestamps null: false
    end
  end
end
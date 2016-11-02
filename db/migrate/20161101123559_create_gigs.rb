class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :name
      t.date :date

      t.timestamps null: false
    end
  end
end

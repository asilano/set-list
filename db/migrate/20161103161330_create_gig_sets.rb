class CreateGigSets < ActiveRecord::Migration
  def change
    create_table :gig_sets do |t|
      t.integer :number
      t.references :gig, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateTrackedSites < ActiveRecord::Migration[5.1]
  def change
    create_table :tracked_sites do |t|
      t.string :homepageURL
      t.integer :totalPV

      t.timestamps
    end
  end
end

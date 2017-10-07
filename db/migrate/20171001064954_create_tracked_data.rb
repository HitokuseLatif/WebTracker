class CreateTrackedData < ActiveRecord::Migration[5.1]
  def change
    create_table :tracked_data do |t|
      t.string :clientIP
      t.string :homepageURL
      t.string :pageURL
      t.integer :days
      t.integer :hour

      t.timestamps
    end
  end
end

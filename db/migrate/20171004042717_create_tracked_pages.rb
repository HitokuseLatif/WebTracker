class CreateTrackedPages < ActiveRecord::Migration[5.1]
  def change
    create_table :tracked_pages do |t|
      t.string :homepageURL
      t.string :pageURL
      t.integer :pageViews

      t.timestamps
    end
  end
end

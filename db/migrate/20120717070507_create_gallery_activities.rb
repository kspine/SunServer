class CreateGalleryActivities < ActiveRecord::Migration
  def change
    create_table :gallery_activities do |t|
      t.string :name
      t.integer :activity_id
      t.integer :provider_id
      t.text :description
      t.text :notes

      t.timestamps
    end
  end
end

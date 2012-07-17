class CreateVideoActivities < ActiveRecord::Migration
  def change
    create_table :video_activities do |t|
      t.string :name
      t.integer :activity_id
      t.integer :provider_id
      t.string :file_path
      t.text :notes
      t.integer :duration
      t.text :description

      t.timestamps
    end
  end
end

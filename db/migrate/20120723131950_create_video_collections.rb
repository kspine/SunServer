class CreateVideoCollections < ActiveRecord::Migration
  def change
    create_table :video_collections do |t|
      t.string :title
      t.string :intro
    
      t.has_attached_file :cover_m
      t.has_attached_file :cover_s

      t.timestamps
    end
  end
end

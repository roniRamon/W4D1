class CreateArtworksTable < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks_tables do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :artist_id, null: false
      t.timestamps
    end
  end
end

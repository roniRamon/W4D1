class FixArtworksTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :artworks_tables, :artworks
  end
end

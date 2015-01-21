class RemovePlacePhotosFromListings < ActiveRecord::Migration
  def up
    remove_column :listings, :place_photos
  end

  def down
    add_column :listings, :place_photos, :string
  end
end

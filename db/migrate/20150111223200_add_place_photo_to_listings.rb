class AddPlacePhotoToListings < ActiveRecord::Migration
  def change
    add_column :listings, :place_photo, :string
  end
end

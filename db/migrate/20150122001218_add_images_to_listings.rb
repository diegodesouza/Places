class AddImagesToListings < ActiveRecord::Migration
  def change
    add_column :listings, :image_one, :string
    add_column :listings, :image_two, :string
    add_column :listings, :image_three, :string
    add_column :listings, :image_four, :string
    add_column :listings, :image_five, :string
  end
end

class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|

    t.string :image1
    t.string :image2
    t.string :image3
    t.string :image4
    t.string :image5
    t.integer :listing_id
    t.integer :user_id

    t.timestamps
    end
  end
end

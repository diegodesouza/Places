class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zipcode, null: false
      t.string :country, default: "United States"
      t.string :property_type, null: false
      t.integer :number_bedroom, null: false, default: "1"
      t.integer :number_accommodate, null: false, default: "1"
      t.integer :user_id

      t.timestamps
    end
  end
end

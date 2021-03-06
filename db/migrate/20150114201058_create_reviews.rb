class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :listing_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end

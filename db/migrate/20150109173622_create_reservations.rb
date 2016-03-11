class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :check_in, null: false
      t.date :check_out, null: false
      t.integer :user_id, null: false
      t.integer :listing_id, null: false

      t.timestamps
    end
  end
end

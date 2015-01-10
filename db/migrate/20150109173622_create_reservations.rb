class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :check_in
      t.datetime :check_out
      t.integer :user_id
      t.integer :listing_id

      t.timestamps
    end
  end
end

class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :guide_id
      t.integer :visitor_id

      t.references :tour, index: true, foreign_key: true

      t.date :date
      t.time :check_in
      t.time :check_out
      t.string :status
      t.integer :total_price
      t.integer :hour_rate

      t.timestamps null: false
    end

    add_foreign_key :bookings, :users, column: "guide_id"
    add_foreign_key :bookings, :users, column: "visitor_id"

    add_index :bookings, :guide_id
    add_index :bookings, :visitor_id
  end
end

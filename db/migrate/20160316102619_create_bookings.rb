class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :tour, index: true, foreign_key: true
      t.date :date
      t.time :check_in
      t.time :check_out
      t.string :status
      t.integer :total_price
      t.integer :hour_rate

      t.timestamps null: false
    end
  end
end

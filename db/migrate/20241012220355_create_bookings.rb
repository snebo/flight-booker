class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.references :flight, null: false, foreign_key: true
      t.integer :seats

      t.timestamps
    end
  end
end

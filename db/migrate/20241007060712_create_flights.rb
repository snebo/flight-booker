class CreateFlights < ActiveRecord::Migration[7.2]
  def change
    create_table :flights do |t|
      t.integer :depart_from
      t.integer :arrive_at

      t.timestamps
    end
  end
end

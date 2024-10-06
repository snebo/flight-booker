class CreateFlights < ActiveRecord::Migration[7.2]
  def change
    create_table :flights do |t|
      t.references :departure, null: false, foreign_key: true
      t.references :arrival, null: false, foreign_key: true
      t.datetime :start
      t.float :duration

      t.timestamps
    end
  end
end

class CreatePassangers < ActiveRecord::Migration[7.2]
  def change
    create_table :passangers do |t|
      t.string :name
      t.string :email
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end

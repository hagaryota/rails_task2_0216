class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :price
      t.integer :persons
      t.integer :days

      t.timestamps
    end
  end
end

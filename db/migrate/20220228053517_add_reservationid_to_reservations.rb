class AddReservationidToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :reservation_id, :integer
  end
end
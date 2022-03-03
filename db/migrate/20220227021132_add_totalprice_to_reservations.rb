class AddTotalpriceToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :totalprice, :integer
  end
end

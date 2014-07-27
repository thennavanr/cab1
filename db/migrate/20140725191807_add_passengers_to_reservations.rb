class AddPassengersToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :passengers, :integer
  end
end

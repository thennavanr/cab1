class ChildSeatToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :child_seat, :boolean
  end
end

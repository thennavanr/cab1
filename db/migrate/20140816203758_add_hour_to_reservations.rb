class AddHourToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :hour, :string
  end
end

class AddRidToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :rid, :string, :limit => 20, :null => false, :unique => true
  end
end

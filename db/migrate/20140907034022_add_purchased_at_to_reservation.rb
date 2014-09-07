class AddPurchasedAtToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :purchased_at, :datetime
  end
end

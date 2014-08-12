class AddOverNightSurchargeToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :over_night_surcharge, :boolean
  end
end

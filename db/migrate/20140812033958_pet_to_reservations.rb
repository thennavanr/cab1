class PetToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :pet, :boolean
  end
end

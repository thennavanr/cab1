class AddServiceTypeToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :service_type, :string
  end
end

class AddMeetGreetToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :meet_greet, :boolean
  end
end

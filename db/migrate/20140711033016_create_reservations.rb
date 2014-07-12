class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :from_add
      t.string :to_add
      t.date :pickup_date
      t.string :pickup_time
      t.string :vechile

      t.timestamps
    end
  end
end

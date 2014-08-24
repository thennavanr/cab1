class CreateSpecialRequests < ActiveRecord::Migration
  def change
    create_table :special_requests do |t|
      t.string :request_type
      t.string :request_value
      t.string :reservation_id

      t.timestamps
    end
  end
end

class AddPriceToSpecialRequest < ActiveRecord::Migration
  def change
    add_column :special_requests, :price, :decimal, :precision => 8, :scale => 2
  end
end

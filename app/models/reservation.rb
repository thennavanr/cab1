class Reservation < ActiveRecord::Base
  has_many :special_requests

  def paypal_url return_url
    values = {
      :business => 'thennavanr@outlook.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => 55,

      "amount_1" => 4,
      "item_name_1" => 'distance',
      "item_number_1" => 4,
      "quantity_1" =>1 

    }
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query

  end

end

class Reservation < ActiveRecord::Base
  has_many :special_requests

  def paypal_url return_url
    values = {
      :business => 'thennavanr@outlook.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice =>id 
    } 
  
    index = 1
    special_requests.each do |item|
      values.merge!( {
      "amount_#{index}" => item.price.to_s,
      "item_name_#{index}" => item.get_desc,
      "item_number_#{index}" => index,
      "quantity_#{index}" =>1 
      })
      index += 1
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

end

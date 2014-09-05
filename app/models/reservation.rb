class Reservation < ActiveRecord::Base
  has_many :special_requests
  
  

  def get_vechile_type
    if  special_requests.exists?(['request_type LIKE ?', "%Vechile%"])
      special_requests.find_by(['request_type LIKE ?', "%Vechile%"]).request_value
    else
      2
    end
  end
def get_no_passengers
    if  special_requests.exists?(['request_type LIKE ?', "%Passengers%"])
      special_requests.find_by(['request_type LIKE ?', "%Passengers%"]).request_value
    else
     1 
    end
end
  def surcharge?
    special_requests.exists?(['request_type LIKE ?', "%Surcharge%"])
  end

  def meet_greet?
    special_requests.exists?(['request_type LIKE ?', "%Meet and Greet at Baggage Claim%"])
  end
  def child_seat?
    special_requests.exists?(['request_type LIKE ?', "%Child Seat%"])
  end 

  def pets?
    special_requests.exists?(['request_type LIKE ?', "%Pet%"])
  end 

  
    
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

class Reservation < ActiveRecord::Base
  validates :name,:from_add,:to_add,:pickup_date,  presence:true
   validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
   validates_format_of :phone, :with => /\A(?:\(\d{3}\)|\d{3})[- ]?\d{3}[- ]?\d{4}\Z/i

  has_many :special_requests

  def get_vechile_type
    if  special_requests.exists?(['request_type LIKE ?', "%Vechile%"])
      special_requests.find_by(['request_type LIKE ?', "%Vechile%"]).request_value
    else
      1
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
      "quantity_#{index}" =>1 
      })
      index += 1
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

end

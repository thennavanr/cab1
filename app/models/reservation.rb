class Reservation < ActiveRecord::Base
  validates :name,:from_add,:to_add,:pickup_date,  presence:true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_format_of :phone, :with => /\A(?:\(\d{3}\)|\d{3})[- ]?\d{3}[- ]?\d{4}\Z/i

  before_create :generate_token
  has_many :special_requests

  def full_time 
    h = hour == "1" ? "AM" : "PM"
    t = time.to_i/60
    k = "#{t}:00 #{h}"
    if(t* 60 < time.to_i)
       k = "#{t}:30 #{h}"
    end
    k = "12:00 #{h}" if time == "1"
    k
  end

  def get_total  
    s = 0
    special_requests.each do |d|
      s=s+d.price
    end
    s
  end

  def delete_all_old_special_requests
   special_requests.all.delete_all if special_requests.count > 0
  end

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



  def paypal_url(return_url,notify_url)
    values = {
      :business => 'smyrnaviningsairporttaxi@gmail.com' ,
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice =>id,
      :notify_url => notify_url
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
    "https://www.paypal.com/cgi-bin/webscr?" + values.to_query
  end

  protected

  def generate_token
    self.rid= loop do
      random_token = SecureRandom.urlsafe_base64(15, false)
      break random_token unless Reservation.exists?(rid: random_token)
    end
  end

end

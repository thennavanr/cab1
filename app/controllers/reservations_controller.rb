class ReservationsController < ApplicationController
  @cart_ready
  def show
    @reservations = Reservation.find(params[:id])
  end

  def new
#   session[:reservation_id] = 22
    @reservation = (session[:reservation_id] ? Reservation.find(session[:reservation_id]) : Reservation.new)
    @anchor="" if @reservation.new_record?
    @anchor = "contact-info-price" if @reservation.id
    @anchor = "contact-info-invoice" if @reservation.special_requests.count > 0
    @tot = get_total @reservation
    session[:reservation_id] = nil
  end

  def create 
    session[:errors] = nil
    if params[:commit]  == 'Continue' || params[:commit]  == 'Book'
      create_reservation
    elsif params[:commit] == 'Checkout'
      update_spl_requests
    end
    @errors = @reservation.errors.messages
    flash.keep
    redirect_to :action => 'new'
  end

  private
  def create_reservation
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    puts "reservation saved successfully"
    session[:reservation_id] = @reservation.id
    session[:errors] = @reservation.errors.messages if @reservation.errors
  end

  def update_spl_requests 
    r_id = reservation_params[:r_did]
    distance = reservation_params[:distance2]
    if r_id
      @reservation = Reservation.find(r_id)
      session[:reservation_id] = @reservation.id

      @reservation.special_requests.new(add_distance distance) if distance
      @reservation.special_requests.new(add_pet) unless reservation_params[:pet] == "0"
      @reservation.special_requests.new(add_meet_greet) unless reservation_params[:meet_greet] == "0"
      @reservation.special_requests.new(add_surcharge) unless reservation_params[:over_night_surcharge] == "0"
      @reservation.special_requests.new(add_child_seat) unless reservation_params[:child_seat] == "0"

      @reservation.special_requests.new(add_vechile reservation_params[:vechile])
      @reservation.special_requests.new(add_passengers reservation_params[:passengers])

      total = get_total @reservation
      @reservation.special_requests.new(add_tax total) if total
      total = get_total @reservation
      @reservation.special_requests.new(add_gratuity total) if total
      @reservation.save!
    end
  end

  def add_passengers val
    {:request_type =>'Number of Passengers', :request_value =>val, :price =>0}
  end

  def add_vechile val
    {:request_type =>'Vechile Type', :request_value =>val, :price =>0}
  end

  def add_tax tot
    tax = tot * 0.07
    {:request_type =>'Tax', :request_value => '7%', :price =>tax}
  end

  def add_gratuity tot
    tax = tot * 0.18
    {:request_type =>'Gratuity', :request_value => '18%', :price =>tax}
  end

  def get_total r 
    s = 0
    r.special_requests.each do |d|
      s=s+d.price
    end
    s
  end

  def add_pet
    {:request_type =>'Pets (Additional fee - $10)', :request_value => 'true', :price =>"10"}
  end

  def add_meet_greet
    {:request_type =>'Meet and Greet at Baggage Claim (Additional fee - $15)', :request_value => 'true', :price =>"15"}
  end

  def add_surcharge
    {:request_type =>'Overnight Surcharge from Midnight to 5:00 am (Additional fee - $10)', :request_value => 'true', :price =>"10"}
  end

  def add_child_seat
    {:request_type =>'Child Seat (Additional fee - $10)', :request_value => 'true', :price =>"10"}
  end

  def add_distance d
    p = 10+(d.to_d*2)
    {:request_type =>'Distance for your Trip', :request_value => d, :price =>p}
  end
  def reservation_params 
    params.require(:reservation).permit!
  end
end


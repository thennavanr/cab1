class ReservationsController < ApplicationController
  @cart_ready
  def show
    @reservations = Reservation.find(params[:id])
  end

  def new
    @reservation = (session[:reservation_id] ? Reservation.find(session[:reservation_id]) : Reservation.new)
    @anchor = "contact-info-price" if @reservation.id
    @anchor = "contact-info-invoice" if @reservation.special_requests.count > 0
    @tot = get_total @reservation

    session[:reservation_id] = nil
  end

  def create
    if params[:commit]  == 'Continue'
      create_reservation
    elsif params[:commit] == 'Checkout'
      update_spl_requests
    end
    redirect_to :action => 'new' 
  end

  private
  
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
      total = get_total @reservation
      @reservation.special_requests.new(add_tax total) if total
      total = get_total @reservation
      @reservation.special_requests.new(add_gratuity total) if total
      @reservation.save!
    end

  end
  def add_tax tot
    tax = tot * 0.07
    {:request_type =>'tax', :request_value => '7%', :price =>tax}
  end

  def add_gratuity tot
    tax = tot * 0.18
    {:request_type =>'gratuity', :request_value => '18%', :price =>tax}
  end

  def get_total r 
    s = 0
    r.special_requests.each do |d|
      s=s+d.price
    end
    s
  end

  def add_pet
    {:request_type =>'pet', :request_value => 'true', :price =>"10"}
  end

  def add_meet_greet
    {:request_type =>'meet_greet', :request_value => 'true', :price =>"15"}
  end

  def add_surcharge
    {:request_type =>'surcharge', :request_value => 'true', :price =>"10"}
  end

  def add_child_seat
    {:request_type =>'child_seat', :request_value => 'true', :price =>"10"}
  end

  def add_distance d
    p = 10+(d.to_d*2)
    {:request_type =>'distance', :request_value => d, :price =>p}
  end

  def create_reservation
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    puts "reservation saved successfully"
    session[:reservation_id] = @reservation.id
  end
  def reservation_params 
    params.require(:reservation).permit!
  end
end


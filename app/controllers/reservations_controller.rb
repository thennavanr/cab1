class ReservationsController < ApplicationController

  @cart_ready
  def show
    @reservation = Reservation.find_by_rid(params[:id])
    @tot = @reservation.get_total 
    ReservationMailer.register_email(@reservation).deliver
    ReservationMailer.booking_alert(@reservation).deliver
  end

  def new
   #session[:reservation_id] = 'kdSIaB019LsKTCmVoqiN'

    @reservation = (session[:reservation_id] ? Reservation.find_by_rid(session[:reservation_id]) : Reservation.new)
    @anchor="" if @reservation.new_record?
    @anchor = "contact-info-price" if @reservation.id
    @anchor = "contact-info-invoice" if @reservation.special_requests.count > 0
    @tot = @reservation.get_total 
    session[:reservation_id] = nil
  end

  def create 
    session[:errors] = nil
    if params[:commit]  == 'Continue' || params[:commit]  == 'Price Quote'
      create_reservation
    elsif params[:commit] == 'Book'
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
    session[:reservation_id] = @reservation.rid
    session[:errors] = @reservation.errors.messages if @reservation.errors
  end

  def update_spl_requests 
    rid = reservation_params[:rid]
    distance = reservation_params[:distance2]
    if rid
      @reservation = Reservation.find_by_rid(rid)
      session[:reservation_id] = @reservation.rid
      @reservation.delete_all_old_special_requests 
      @reservation.special_requests.new(add_distance distance) if distance
      @reservation.special_requests.new(add_pet) unless reservation_params[:pet] == "0"
      @reservation.special_requests.new(add_meet_greet) unless reservation_params[:meet_greet] == "0"
      @reservation.special_requests.new(add_surcharge) unless reservation_params[:over_night_surcharge] == "0"
      @reservation.special_requests.new(add_child_seat) unless reservation_params[:child_seat] == "0"

      @reservation.special_requests.new(add_vechile reservation_params[:vechile])
      @reservation.special_requests.new(add_passengers reservation_params[:passengers])

      total = @reservation.get_total 
      #@reservation.special_requests.new(add_tax total) if total
      #total = @reservation.get_total 
      @reservation.special_requests.new(add_gratuity total) if total
      if @reservation.save
    #   ReservationMailer.register_email(@reservation).deliver
    #   ReservationMailer.booking_alert(@reservation).deliver
     end

    end
  end

  def add_passengers val
    p = 0
    p = (val.to_i-1) * 5 if val.to_i  > 1
    {:request_type =>'Number of Passengers', :request_value =>val, :price =>p}
  end

  def add_vechile val
    p = 0
    p = 25 if val.to_i == 2
    {:request_type =>'Additional Charge for SUV', :request_value =>val, :price =>p}
  end

  def add_tax tot
    tax = tot * 0.07
    {:request_type =>'Service Charge', :request_value => '7%', :price =>tax}
  end

  def add_gratuity tot
    tax = tot * 0.20
    {:request_type =>'Gratuity', :request_value => '20%', :price =>tax}
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
    p = 10+(d.to_d*2.20)
    {:request_type =>'Distance for your Trip', :request_value => d, :price =>p}
  end
  def reservation_params 
    params.require(:reservation).permit!
  end

end


class ReservationsController < ApplicationController


  def show
    @reservations = Reservation.find(params[:id])
  end

  def new
    @reservation = (session[:reservation_id] ? Reservation.find(session[:reservation_id]) : Reservation.new)
    @anchor = "contact-info-price" if @reservation.id
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    puts "reservation saved successfully"
    session[:reservation_id] = @reservation.id
    redirect_to :action => 'new' 
  end

  private
  def reservation_params 
    params.require(:reservation).permit!
  end
end


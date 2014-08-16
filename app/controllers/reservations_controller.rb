class ReservationsController < ApplicationController

  @@res = Reservation.new 

  def show
    @reservations = Reservation.find(params[:id])
    @@res = @reservations
  end

  def new
    @reservation = @@res 
    @anchor = "contact-info-price" if @reservation.id
  end

  def create
    binding.pry
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    puts "reservation saved successfully"
    @@res = @reservation
    redirect_to :action => 'new' 
  end

  private
  def reservation_params 
    params.require(:reservation).permit!
  end
end


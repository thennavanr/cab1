class ReservationsController < ApplicationController

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    redirect_to @reservation
  end

  private
  def reservation_params 
    params.require(:reservation).permit(:name, :email, :phone)
  end
end

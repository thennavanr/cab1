class ReservationsController < ApplicationController

  def show
  end

  def create
    @reservation = Reservation.new(params[:reservation])
    @reservation.save
    redirect_to @reservation

  end
end

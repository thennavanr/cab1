class HomeController < ApplicationController
  def index
  end

  def show
  end

  def new 
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(home_params)
    @reservation.save
  end

  private
  def reservation_params 
    params.require(:reservation).permit(:name, :email, :phone)
  end
end

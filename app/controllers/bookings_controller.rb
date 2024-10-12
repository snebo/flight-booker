class BookingsController < ApplicationController
  def new
    @flight = Flight.find_by(booking_params[:id])
  end

  private
  def booking_params
    params.require(:bookings).permit(:id, :num_tickets)
  end
end

class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    @seats = params[:seats].to_i
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:success] = "Object successfully created"
      @booking.flight.update(seats: @booking.flight.seats - @booking.passangers.count)
      redirect_to @booking
    else
      flash[:error] = "Something went wrong"
      puts "error #{:error}"
      render "new"
    end
  end
  def show
        @booking = Booking.find(params[:id])
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, :seats, passangers_attributes: [ :name, :email ])
  end
end

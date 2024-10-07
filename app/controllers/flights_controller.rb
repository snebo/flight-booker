class FlightsController < ApplicationController
  before_action :set_flight, only: [ :show, :edit, :update, :destroy ]

  def index
    @flights = Flight.all
    @Airports = Airport.all
    @flight_dates = []
    @flights.each do |flight|
      @flight_dates << Date.parse(flight.start_date.strftime("%y/%m/%d"))
    end
    @flight_dates = @flight_dates.sort.uniq
    # @flight_dates = Flight.select("DATE(start_date) as flight_date").distinct.order("flight_date ASC").map(&:flight_date)
  end
  def show
  end

  def def(new)
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_parmas)
    if @flight.save
      redirect_to @flight, notice: "Flight was saved successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @flight.update(flight_parmas)
      redirect_to @flight, notice: "Flight info was updated"
    else
      render :edit
    end
  end

  def destroy
    @flight.destroy
    redirect_to flights_url, notice: "Deleted flight data"
  end

  private

  def set_flight
    @flight = Flight.find(params[:id])
  end

  def flight_parmas
    params.require(:flight).permit(:arrive_at, :depart_from, :start_date, :seats)
  end
end

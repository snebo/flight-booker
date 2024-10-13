class FlightsController < ApplicationController
  before_action :set_flight, only: [ :show, :edit, :update, :destroy ]

  def index
    # Fetch airports and available dates
    @airports = Airport.all
    @flight_dates = Flight.pluck(:start_date).map { |date| date.strftime("%Y-%m-%d") }.sort.uniq

    # Initialize the instance variables
    @avail_flights = []
    @possible_flights = []

    # Filter available flights based on user input
    if params[:depart_from].present? && params[:arrive_at].present? && params[:start_date].present? && params[:seats].present?
      @avail_flights = Flight.where(depart_from: params[:depart_from])
                             .where(arrive_at: params[:arrive_at])
                             .where("DATE(start_date) = ?", params[:start_date])
                             .where("seats >= ?", params[:seats])

      @possible_flights = Flight.where(depart_from: params[:depart_from])
                                 .where(arrive_at: params[:arrive_at])
                                 .where("seats >= ?", params[:seats])
    end

    puts "Match: #{@avail_flights.map(&:id)}"
  end

  def show
  end

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)
    if @flight.save
      redirect_to @flight, notice: "Flight was saved successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @flight.update(flight_params)
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

  def flight_params
    params.require(:flight).permit(:arrive_at, :depart_from, :start_date, :seats)
  end
end

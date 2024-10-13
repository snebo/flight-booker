# Flight Booker

Flight Booker is a Rails 7 web app that lets users search for available flights, book a flight, and register passengers. It streamlines the process of finding flights, booking seats, and managing passenger information.

## Features

- **Flight Search:** Search flights by departure, arrival, date, and number of seats.
- **Booking & Passenger Registration:** Users can create bookings and add passenger details (name and email).
- **Seat Availability:** Seats are dynamically updated when bookings are made.
- **Flight & Passenger Relations:** Flights, Bookings, and Passengers are fully associated.

## Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/flight-booker.git
   cd flight-booker ```

2. **Install Dependencies**
    ```bash
    bundle install
3. **SetUp the Database**
    ```bash
    rails db:create
    rails db:migrate
    # (optional) seed the database with flights and airports
    rails db:seed ```
4. **Start the Rails server**
    ```bash
    rails server
    ```

## How to Use

1. **Search Flights:** Select departure, arrival airports, date, and number of passengers.
2. **View Available Flights:** The app will display flights matching the search criteria.
3. **Book a Flight:** Choose an available flight and enter passenger details to complete the booking.
4. **Confirm Booking:** Review and confirm the booking, after which the seats will be reserved.

## How It Works

- **Flight Search:** The user filters flights by selecting the departure airport, arrival airport, flight date, and number of passengers.
- **Booking and Passengers:** When booking a flight, the user provides passenger details (name, email) for each seat.
- **Dynamic Seat Update:** As bookings are confirmed, the available seats on a flight decrease accordingly.

## Acknowledgement

This project was developed as part of [The Odin Project](https://www.theodinproject.com) curriculum, which helps students learn full-stack web development.

## License

This project is licensed under the MIT License. Feel free to use, modify, and distribute this project.

## Contribution

Contributions are encouraged! Fork the repository, make changes, and submit a pull request for review.

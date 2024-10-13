class AddstartDateToFlights < ActiveRecord::Migration[7.2]
  def change
    add_column :flights, :start_date, :date
    add_column :flights, :duration, :time
    add_column :flights, :seats, :integer
    # Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end

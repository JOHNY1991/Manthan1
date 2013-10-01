class AddColumnsToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :attending_status, :string
    add_column :trips, :f_ticket, :string
    add_column :trips, :r_ticket, :string
    add_column :trips, :hotel, :string
  end
end

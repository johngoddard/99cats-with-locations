class AddLocationForRental < ActiveRecord::Migration
  def change
    add_column :cat_rental_requests, :lat, :decimal, {:precision=>10, :scale=>6, :null => false, :default => 37.7913765 }
    add_column :cat_rental_requests, :long, :decimal, {:precision=>10, :scale=>6, :null => false, :default => -122.3958136 }
  end
end

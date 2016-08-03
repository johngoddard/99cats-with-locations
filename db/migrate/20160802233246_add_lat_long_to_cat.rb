class AddLatLongToCat < ActiveRecord::Migration
  def change
    add_column :cats, :lat, :decimal, {:precision=>10, :scale=>6, :null => false, :default => 37.7913765 }
    add_column :cats, :long, :decimal, {:precision=>10, :scale=>6, :null => false, :default => -122.3958136 }
  end
end

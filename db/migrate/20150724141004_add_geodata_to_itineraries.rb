class AddGeodataToItineraries < ActiveRecord::Migration
  def change
    add_column :itineraries, :home_lat, :float
    add_column :itineraries, :home_lng, :float
    add_column :itineraries, :work_lat, :float
    add_column :itineraries, :work_lng, :float
  end
end

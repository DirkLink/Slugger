class Directions
   attr_reader :distance, :duration, :start_address, :end_address, :home_lat, :home_lng, :work_lat, "work_lng"

  def initialize route_data
    @distance       = route_data.fetch("distance").fetch("text").to_f
    @duration       = route_data.fetch("duration").fetch("text")
    @start_address  = route_data.fetch "start_address"
    @end_address    = route_data.fetch "end_address"
    @home_lat       = route_data.fetch("start_location").fetch("lat")
    @home_lng       = route_data.fetch("start_location").fetch("lng")
    @work_lat       = route_data.fetch("end_location").fetch("lat")
    @work_lng       = route_data.fetch("end_location").fetch("lng")
  end
end
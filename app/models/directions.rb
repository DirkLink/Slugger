class Directions
   attr_reader :distance, :duration, :start_address, :end_address

  def initialize route_data
    @distance       = route_data.fetch("distance").fetch("text").to_f
    @duration       = route_data.fetch("duration").fetch("text")
    @start_address  = route_data.fetch "start_address"
    @end_address    = route_data.fetch "end_address"
  end
end
class MapsApi
  include HTTParty
  MAPKEY = Figaro.env.maps_key
  def self.get_directions origin, destination
    dir = MapsApi.get("https://maps.googleapis.com/maps/api/directions/json", query: {origin: origin, destination: destination, key: MAPKEY})
    route_data = dir["routes"].first["legs"].first
    route_info = Directions.new(route_data)
    route_info
  end
end
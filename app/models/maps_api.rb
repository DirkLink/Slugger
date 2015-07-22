class MapsApi
  include HTTParty
  MAPKEY = Figaro.env.maps_key
  def self.get_directions
    dir = MapsApi.get("https://maps.googleapis.com/maps/api/directions/json", query: {origin: "reston town center", destination: "dupont circle", key: MAPKEY})
  end
end
class Itinerary < ActiveRecord::Base
  has_one :user

  def lookup_locales
    locales = MapsApi.get_directions home_locale, work_locale
    update(home_lat: locales.home_lat,
      home_lng: locales.home_lng,
      work_lat: locales.work_lat,
      work_lng: locales.work_lng) 
  end

  def distance user1, user2
    Haversine.distance()
  end
end
class Itinerary < ActiveRecord::Base
  has_one :user

  def lookup_locales
    locales = MapsApi.get_directions home_locale, work_locale
    update(home_lat: locales.home_lat,
      home_lng: locales.home_lng,
      work_lat: locales.work_lat,
      work_lng: locales.work_lng) 
  end

  def home_distance itin1
    if itin1.home_lat && itin1.home_lng && self.home_lat && self.home_lng
      Haversine.distance(itin1.home_lat, itin1.home_lng, self.home_lat, self.home_lng).to_miles
    end
  end

  def work_distance itin1
    if itin1.work_lat && itin1.work_lng && self.work_lat && self.work_lng
      Haversine.distance(itin1.work_lat, itin1.work_lng, self.work_lat, self.work_lng).to_miles
    end
  end

  def clean_work_time
    if self.evening_time
      self.evening_time.strftime("%I:%M %p")
    end
  end

  def clean_home_time
    if self.morning_time
      self.morning_time.strftime("%I:%M %p")
    end
  end

  def as_json opts
    {
      morning_time:    clean_home_time,
      evening_time:    clean_work_time,
      home_locale:     home_locale,
      work_locale:     work_locale,
      home_lat:        home_lat,
      home_lng:        home_lng,
      work_lat:        work_lat,
      work_lng:        work_lng
    }
  end
end
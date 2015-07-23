class Itinerary < ActiveRecord::Base
  has_one :user

  def distance
    #TODO Implement haversine
  end
end
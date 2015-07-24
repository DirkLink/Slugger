class MapsJob < ActiveJob::Base
  queue_as :default

  def perform itinerary
    itinerary.lookup_locales
  end
end
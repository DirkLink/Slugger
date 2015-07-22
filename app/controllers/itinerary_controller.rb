class ItineraryController < ApplicationController
  #  before_action do
  #   request.format = :json
  # end
  def index
    @first_name = "Dirk"
    @email = "Dirk@sluggr.com"
    @morning_time = "8:00"
    @evening_time = "17:00"
    @home_locale = "Reston Town Center"
    @work_locale = "Dupont Circle"
  end
end

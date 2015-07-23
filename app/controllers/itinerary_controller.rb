class ItineraryController < ApplicationController

  def index
    @first_name = "Dirk"
    @email = "Dirk@sluggr.com"
    @morning_time = "8:00"
    @evening_time = "17:00"
    @home_locale = "Reston Town Center"
    @work_locale = "Dupont Circle"
  end
  def home
    render json: current_user
  end

  def create
    itin = current_user.itinerary.new(
          morning_time: params[:morning_time],
          evening_time: params[:evening_time],
          home_locale:  params[:home_locale],
          work_locale:  params[:work_locale]
        )
    if itin.save
      render json: itin
    else 
      render json: { error: "itinerary not saved" }
    end
  end
end

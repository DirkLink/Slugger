class DemoUserController < ApplicationController
  def index
    @users = current_user.nearest_overall
    # @users = User.all.includes(:itinerary)
  end
  def login
    if current_user
      if current_user.itinerary
        render json: {user: current_user, itinerary: current_user.itinerary }
      else
        render json: {user: current_user, itinerary: Itinerary.new }
      end
    else
      render json: { error: "User not found" }
    end
  end

  def register
    new_user = User.new(
          email:      params[:email],
          password:   params[:password],
          first_name: params[:first_name],
          last_name:  params[:last_name],
          username:   params[:username],
        )
    if new_user.save
      itin = Itinerary.new
      itin.user_id = new_user.id
      itin.save
      render json: { user: new_user, itinerary: itin }
    else 
      render json: { error: "registration failed" }
    end
  end

  def edit
    user = current_user
    itin = current_user.itinerary
    itin.morning_time = params[:itinerary][:morning_time]
    itin.evening_time = params[:itinerary][:evening_time]
    itin.home_locale = params[:itinerary][:home_locale]
    itin.work_locale = params[:itinerary][:work_locale]

    user_params = params.require(:user).permit :first_name, :last_name, :email, :username
    if user.update(user_params) && itin.save
      MapsJob.perform_later itin   
      render json: { user: current_user, itinerary: itin }
    else
      render json: { error: "update failed" }
    end 
  end

end

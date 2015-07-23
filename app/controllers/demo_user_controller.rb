class DemoUserController < ApplicationController
  def index
    @users = User.all.includes(:itinerary)
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
      render json: new_user
    else 
      render json: { error: "registration failed" }
    end
  end

  def edit
    user = current_user
    user.first_name = params[:user][:first_name]
    user.last_name  = params[:user][:last_name] 
    user.email      = params[:user][:email] 
    user.username   = params[:user][:username]
    
    if current_user.itinerary
      itin = current_user.itinerary
      itin.morning_time = params[:itinerary][:morning_time]
      itin.evening_time = params[:itinerary][:evening_time]
      itin.home_locale = params[:itinerary][:home_locale]
      itin.work_locale = params[:itinerary][:work_locale]
    else
      itin = Itinerary.new
      itin.morning_time = params[:itinerary][:morning_time]
      itin.evening_time = params[:itinerary][:evening_time]
      itin.home_locale = params[:itinerary][:home_locale]
      itin.work_locale = params[:itinerary][:work_locale]
      itin.user_id = current_user.id
    end

    if user.save && itin.save    
      render json: { user: current_user, itinerary: itin }
    else
      render json: { error: "update failed" }
    end 
  end

end

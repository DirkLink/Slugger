class DemoUserController < ApplicationController
  
  def data
    @data = User.all.includes(:itinerary)
    @groups = Group.all.includes(:driver, :rider_one, :rider_two, :rider_three, :rider_four)
  end

  def index
    @users = current_user.nearest_overall
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
          driver:     params[:driver] 
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
    itin.morning_time = Time.parse(params[:itinerary][:morning_time]) if params[:itinerary][:morning_time]
    itin.evening_time = Time.parse(params[:itinerary][:evening_time]) if params[:itinerary][:evening_time]
    itin.home_locale = params[:itinerary][:home_locale]
    itin.work_locale = params[:itinerary][:work_locale]

    user_params = params.require(:user).permit :first_name, :last_name, :email, :username, :driver, :bio, :preferences
    if user.update(user_params) && itin.save
      if itin.home_locale && itin.work_locale
        MapsJob.perform_later itin   
      end
      render json: { user: current_user, itinerary: itin }
    else
      render json: { error: "update failed" }
    end 
  end

  def edit_ios
    user = current_user
    itin = current_user.itinerary
    itin.morning_time = Time.parse(request.headers[:morning_time]) if request.headers[:morning_time]
    itin.evening_time = Time.parse(request.headers[:evening_time]) if request.headers[:evening_time]
    itin.home_locale = request.headers[:home_locale]
    itin.work_locale = request.headers[:work_locale]
    user.first_name = request.headers[:first_name]
    user.last_name = request.headers[:last_name]
    user.email = request.headers[:email]
    user.username = request.headers[:username]
    user.bio = request.headers[:bio]
    user.preferences = request.headers[:preferences]

    # user_params = params.permit :first_name, :last_name, :email, :username, :driver, :bio, :preferences
    if user.save && itin.save
      if itin.home_locale && itin.work_locale
        MapsJob.perform_later itin   
      end
      render json: { user: current_user, itinerary: itin }
    else
      fail
      render json: { error: "update failed" }
    end 
  end

  def register_ios
    new_user = User.new(
          email:      request.headers[:email],
          password:   request.headers[:password],
          first_name: request.headers[:first_name],
          last_name:  request.headers[:last_name],
          username:   request.headers[:username],
          driver:     request.headers[:driver] 
        )
    if new_user.save
      itin = Itinerary.new
      itin.user_id = new_user.id
      itin.save
      render json: { user: new_user, itinerary: itin }
    else 
      fail
      render json: { error: "registration failed" }
    end
  end

end

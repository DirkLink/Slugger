class DemoUserController < ApplicationController
  def index
    @users = DemoUser.all
  end

  def create
    @user = DemoUser.new(
      email: params[:email]
      )
    if @user.save!
      render json: @user
    end
  end
end

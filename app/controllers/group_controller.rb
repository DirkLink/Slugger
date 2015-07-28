class GroupController < ApplicationController
  def index
    group = current_user.group
    @group = [group.driver, group.rider_one, group.rider_two, group.rider_three, group.rider_four]
  end

  def create
    if current_user.group      
      group = current_user.group
      rider = User.find params[:rider_id]
      if group.rider_one_id == nil
        group.update(rider_one_id: rider.id)
        @group = [group.driver, group.rider_one, group.rider_two, group.rider_three, group.rider_four]
        render :index and return
      end
      if group.rider_two_id == nil
        group.update(rider_two_id: rider.id)
        @group = [group.driver, group.rider_one, group.rider_two, group.rider_three, group.rider_four]
        render :index and return
      end
      if group.rider_three_id == nil
        group.update(rider_three_id: rider.id)
        @group = [group.driver, group.rider_one, group.rider_two, group.rider_three, group.rider_four]
        render :index and return
      end
      if group.rider_four_id == nil
        group.update(rider_four_id: rider.id)
        @group = [group.driver, group.rider_one, group.rider_two, group.rider_three, group.rider_four]
        render :index and return
      end 
      render json: {error: "Group is Full"}
    else
      group = Group.new(
        driver_id: current_user.id,
        rider_one_id: params[:rider_id]
        )
      if group.save
        @group = [group.driver, group.rider_one, group.rider_two, group.rider_three, group.rider_four]
      else
        render json: {error: "Group Not Saved"}
      end
    end
  end
end

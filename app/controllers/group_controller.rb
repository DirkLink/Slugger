class GroupController < ApplicationController

  def index 
    group = current_user.in_a_group?
    if group
      @group = [group.driver, group.rider_one, group.rider_two, group.rider_three, group.rider_four]
    else
      render json: {message: "This user is not in a group"}
    end
  end

  def deny
    redirect_to "sluggr.herokuapp.com"
  end

  def confirm
    url = "sluggr.herokuapp.com"
    inviter = User.find params[:inviter]
    rider = User.find params[:invitee]
    if inviter.group 
      if group.rider_one_id == nil
        group.update(rider_one_id: rider.id)
        redirect_to url and return
      end
      if group.rider_two_id == nil
        group.update(rider_two_id: rider.id)
        redirect_to url and return
      end
      if group.rider_three_id == nil
        group.update(rider_three_id: rider.id)
        redirect_to url and return
      end
      if group.rider_four_id == nil
        group.update(rider_four_id: rider.id)
        redirect_to url and return
      end 
    else
        group = Group.new(
        driver_id: inviter.id,
        rider_one_id: rider.id
        )
      group.save
      redirect_to url
    end
  end

  def invite
    rider = User.find params[:rider_id]
    if current_user.group       
      group = current_user.group
      @group = [group.driver, group.rider_one, group.rider_two, group.rider_three, group.rider_four]
      if group.rider_one_id == nil
        UserMailer.invite_email(rider, current_user).deliver_later
        @group 
        render :index and return
      end
      if group.rider_two_id == nil
        @group
        UserMailer.invite_email(rider, current_user).deliver_later
        render :index and return
      end
      if group.rider_three_id == nil
        @group
        UserMailer.invite_email(rider, current_user).deliver_later 
        render :index and return
      end
      if group.rider_four_id == nil
        @group
        UserMailer.invite_email(rider, current_user).deliver_later 
        render :index and return
      end 
      render json: {error: "Group is Full"}
    else
      UserMailer.invite_email(rider, current_user).deliver_later 
      render :index
    end
  end

  def leave
    group = current_user.in_a_group?
    if group && !current_user.is_a_driver?
      if group.rider_one == current_user
        group.update(rider_one_id: nil)
      end
      if group.rider_two == current_user
        group.update(rider_two_id: nil)
      end
      if group.rider_three == current_user
        group.update(rider_three_id: nil)
      end
      if group.rider_four == current_user
        group.update(rider_four_id: nil)
      end
      render json: {message: "User no longer in group"}
    else
      render json: {message: "Something went wrong"}
    end
  end

  def disband
    group = current_user.in_a_group?
    if group.driver == current_user
      group.delete
      render json: {message: "Group disbanded"}
    else
      render json: {error: "User is not group leader"}
    end
  end

end

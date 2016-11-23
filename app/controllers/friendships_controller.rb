class FriendshipsController < ApplicationController
  include FriendshipsHelper

  def index
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    @friend = @friendship.friend
    @profile = @friendship.friend.profile
    render :new
  end

  def new
    # @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    # @friend = @friendship.friend
    # @profile = @friendship.friend.profile
    # render :new
  end

  def create

    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    # @friendship = current_user.friendships.build(friendship_params)
    @friend = @friendship.friend
    @profile = @friendship.friend.profile
    p @profile
    if @friendship.save
      flash[:notice] = "Added friend."
      friend_request

      # render new_friend form
      # render :new
      # user will complete form and be redirected to dashboard_index_path
      p @friendship
      p "****" * 80
      render :new
    else
      p "this did not work"
      flash[:error] = "Unable to add friend."
      redirect_to dashboard_index_path
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    friend_request_ignore
    flash[:notice] = "Friendship request ignored"
    redirect_to dashboard_index_path
  end

  def show
    @friendship = Friendship.find(params[:id])
  end

  def edit
    @friendship = Friendship.find(params[:id])
  end


  def custom_update
    friendship_params =  params.require(:friendship).permit(:user_id, :friend_id, :message, :answer, :link_portfolio, :link_role)
    @friendship.update_attributes(friendship_params)
  end



  def update
    friend_request_accept
    flash[:notice] = "Accepted friendship."
    redirect_to dashboard_index_path
  end
end

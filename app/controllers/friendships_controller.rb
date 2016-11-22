class FriendshipsController < ApplicationController
  include FriendshipsHelper

  def index
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    @friend = @friendship.friend
    @profile = @friendship.friend.profile
    render :new
  end

  def new
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    @friend = @friendship.friend
    @profile = @friendship.friend.profile
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    @friend = @friendship.friend
    @profile = @friendship.friend.profile
    p @profile
    p "****" * 80
    p @friendship
    if @friendship.save
      flash[:notice] = "Added friend."
      friend_request

      # render new_friend form
      # render :new
      # user will complete form and be redirected to dashboard_index_path
      redirect_to dashboard_index_path
    else
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

  def update
    friend_request_accept
    flash[:notice] = "Accepted friendship."
    redirect_to dashboard_index_path

  end
end

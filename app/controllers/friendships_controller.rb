class FriendshipsController < ApplicationController
  include FriendshipsHelper

  def index
    @friendship = Friendship.new(:user_id => params[:user_id], :friend_id => params[:friend_id])
    @friend = @friendship.friend
    @profile = @friendship.friend.profile
    p "INDEX INDEX INDEX"
    render :new
  end

  def new
    @friendship = Friendship.new(:user_id => params[:user_id], :friend_id => params[:friend_id])
    p @friendship
    # @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    # @friend = @friendship.friend
    # @profile = @friendship.friend.profile
    # render :new
  end

  def create
    # @friendship = Friendship.find(params[:friend_id])
    # @friendship = Friendship.new(friendship_params)
    # @friendship = Friendship.new(:friend_id => params[:friend_id])
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    p @friendship
    @friend = @friendship.friend
    # @profile = @friendship.friend.profile
    # p @profile


    if @friendship.save
      flash[:notice] = "Added friend."
      friend_request
      p "CREATE CREATE CREATE"

      # render new_friend form
      # render :new
      # user will complete form and be redirected to dashboard_index_path
      p @friendship
      p "****" * 80
      #we need to render this created friendship, so we can update it
      redirect_to edit_friendship_path(@friendship)
      # redirect_to dashboard_index_path
    else
      p "this did not work"
      flash[:error] = "Unable to add friend."
      redirect_to dashboard_index_path
    end
  end

  def destroy
    @friendship = Friendship.find(params[:d])
    friend_request_ignore
    flash[:notice] = "Friendship request ignored"
    redirect_to dashboard_index_path
  end

  def show
    @friendship = Friendship.find(params[:id])
    @friend = @friendship.friend
    @profile = @friendship.friend.profile
  end

  def edit
    @friendship = Friendship.find(params[:id])
    p @friendship
    @friend = @friendship.friend
    @profile = @friendship.friend.profile
  end


  def custom_update
    @friendship.update_attributes(friendship_params)
  end

  def update
    @friendship = Friendship.find(params[:id])
    updated_attributes = params.require(:friendship).permit(:user_id, :friend_id, :message, :link_portfolio, :link_role, :answer)
    @friendship.update_attributes(updated_attributes)
    # update attributes here
    p @friendship
    friend_request_accept
    flash[:notice] = "Accepted friendship."
    p @friendship
    redirect_to @friendship
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id, :message, :link_portfolio, :link_role, :answer)
  end
end


# Started PATCH "/profiles/1" for ::1 at 2016-11-23 03:53:52 -0800
# Processing by ProfilesController#update as HTML
#   Parameters: {"utf8"=>"✓", "authenticity_token"=>"uEuSiwTFlQtUvniIAt7a4giGJDemmVet+tSkzAmgZFZ9DyromLl5K9sLFHgsbh2ub1pTl6tXkZM7gd8Gsq+LxA==", "profile"=>{"firstname"=>"Joseph ", "lastname"=>"Maiki", "city"=>"San Francisco", "state"=>"CA", "company"=>"", "bio"=>"", "criteria_question"=>"WHAT IS THE MEANING OF LIFE? ", "skills"=>"", "linkedin"=>"", "portfolio"=>"", "seeker"=>"sourcer"}, "commit"=>"Update", "id"=>"1"}
#   Profile Load (0.6ms)  SELECT  "profiles".* FROM "profiles" WHERE "profiles"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
#    (0.6ms)  BEGIN
#   User Load (0.4ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
#   SQL (0.6ms)  UPDATE "profiles" SET "firstname" = $1, "linkedin" = $2, "bio" = $3, "company" = $4, "skills" = $5, "criteria_question" = $6, "portfolio" = $7, "updated_at" = $8 WHERE "profiles"."id" = $9  [["firstname", "Joseph "], ["linkedin", ""], ["bio", ""], ["company", ""], ["skills", ""], ["criteria_question", "WHAT IS THE MEANING OF LIFE? "], ["portfolio", ""], ["updated_at", 2016-11-23 11:53:52 UTC], ["id", 1]]
#    (0.5ms)  COMMIT
#    (0.1ms)  BEGIN
#    (0.2ms)  COMMIT
# Redirected to http://localhost:3000/profiles/1
# Completed 302 Found in 68ms (ActiveRecord: 3.0ms)
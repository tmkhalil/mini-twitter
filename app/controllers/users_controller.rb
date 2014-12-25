class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user_posts = User.find(params[:id]).posts
    @following = current_user.followed_users
    @followers = current_user.followers
  end

  def index
    @all_users = User.all
  end
  
  def following
    @following_users = User.find(params[:id]).followed_users
  end

  def followers
    @followers = User.find(params[:id]).followers
  end
  
  

end

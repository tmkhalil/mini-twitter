class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user_posts = User.find(params[:id]).posts
    @following = User.find(params[:id]).followed_users
    @followers = User.find(params[:id]).followers
    @user = User.find(params[:id])
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

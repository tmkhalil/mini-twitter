class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user_posts = User.find(params[:id]).posts
  end

  def index
    @all_users = User.all
    
  end

end

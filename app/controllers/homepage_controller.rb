class HomepageController < ApplicationController
  before_filter :authenticate_user!
  def home
    #@home_posts = Post.all
    @followed_users = current_user.followed_users
    @followers = current_user.followers
    @feed = current_user.feed
  end

  def create
    post_text =  params['post_form']['new_post']
    @new_post=current_user.posts.create(:content=>post_text)
    redirect_to(homepage_home_path,notice:"new post has been created successfully")
  end

end

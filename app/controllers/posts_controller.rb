class PostsController < ApplicationController
  before_filter :is_authurized, :only => [:destroy,:update]
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to(homepage_home_path,notice:"The post has been destroyed successfully")
  end

  def update
  end
  

  def is_authurized
     if Post.find(params[:id]).user != current_user
       redirect_to(homepage_home_path,notice:"Sorry, you are not authorized to do this action")
     end
  end
  
end

class Post < ActiveRecord::Base
  attr_accessible :content, :user_id
  validates_presence_of :user_id
  validates :content, :length => {:minimum =>1}
  belongs_to :user
  default_scope order('posts.created_at DESC')

  
  def self.from_users_followed_by(user)
    followed_user_ids = user.followed_user_ids
    where("user_id IN (?) OR user_id = ?", followed_user_ids, user)
  end

end

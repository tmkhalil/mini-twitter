class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, :dependent => :destroy
  has_many :relationships, foreign_key: "follower_id", :dependent => :destroy
  has_many :followed_users, :through => :relationships, :source => :followed 
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body



  def following?(other_user)
    self.relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    self.relationships.create!(followed_id: other_user.id)
  end  
  
  def unfollow!(other_user)
    self.relationships.find_by_followed_id(other_user.id).destroy
  end

  def feed
    Post.from_users_followed_by(self)
  end


end

class Post < ActiveRecord::Base
  attr_accessible :content, :uer_id
  validates_presence_of :user_id
  validates :content, :length => {:minimum =>1}
  belongs_to :user
  default_scope order('created_at DESC')
end

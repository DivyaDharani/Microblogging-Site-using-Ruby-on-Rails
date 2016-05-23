class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  has_many :likes, dependent: :destroy
	
  validates :content, presence: true, length: { maximum: 140}
  validates :user_id,presence: true
  default_scope(:order=> 'microposts.created_at DESC')  #DESC - descending
  #default_scope order: 'microposts.created_at DESC'                                   
end

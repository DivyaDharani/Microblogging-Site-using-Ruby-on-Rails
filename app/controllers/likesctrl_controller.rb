class LikesctrlController < ApplicationController  
  before_filter :signed_in_user   #before all the below methods
  rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique
  def update
	@obj=Like.where({:micropost_id=> params[:id],:user_id=>current_user.id}).first
	if @obj.nil?
	@like=Like.new(:micropost_id=>params[:id],:user_id=>current_user.id,:like_or_unlike => "like")
		if @like.save

		else
			flash[:error] = "Error has occurred!"
    		end
	else
		
		if @obj.like_or_unlike=="like"
			@obj.destroy
		elsif @obj.like_or_unlike=="unlike"
			@obj.update_attribute(:like_or_unlike,"like")
			@obj.save
		end
		
	end
	redirect_to root_url
  end

  def destroy
  end

  def record_not_unique
	flash[:error] = "Already done!"
      	redirect_to root_url
  end
end

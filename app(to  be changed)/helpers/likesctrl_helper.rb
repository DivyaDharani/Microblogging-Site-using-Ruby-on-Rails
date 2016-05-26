module LikesctrlHelper


def my_like_link(m_id,url,meth)
	url=url+"#{m_id}"	
	name="Like"
	color="blue"
	likeobj=Like.where(:micropost_id=>m_id,:user_id=>current_user.id).first
	if likeobj && likeobj.like_or_unlike=="like" 
		name="Liked"
		color="red"
	end
	
	return "<a href='#{url}' id='likefor#{m_id}' data-method='#{meth}' data-remote='true' style='color:#{color};'>#{name}</a>".html_safe
end

def likes(m_id)
	mpost=Micropost.find(m_id)
	count=mpost.num_likes
	if(count==1)
		return "#{count} like"
	else
		return	"#{count} likes"
	end
end
end

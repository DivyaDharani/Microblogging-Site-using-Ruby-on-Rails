module UnlikesctrlHelper

def my_unlike_link(m_id,url,meth)
	url=url+"#{m_id}"	
	name="Unlike"
	color="blue"
	unlikeobj=Like.where(:micropost_id=>m_id,:user_id=>current_user.id).first
	if unlikeobj && unlikeobj.like_or_unlike=="unlike" 
		name="Unliked"
		color="red"
	end
	return "<a href='#{url}' data-method='#{meth}' style='color:#{color};'>#{name}</a>".html_safe
end

end

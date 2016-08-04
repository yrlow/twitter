post '/users/:user_id/followed/:followed_id' do
	if Follow.find_by(follower_id: params[:user_id], followed_id: params[:followed_id])
		redirect "/users/#{current_user.id}/home"
	else
		Follow.create(follower_id: params[:user_id], followed_id: params[:followed_id])
		redirect "/users/#{current_user.id}/home"
	end
end

get '/follow/user/:user_id/followings' do
	@followings = Follow.where(follower_id: params[:user_id])
	erb :'follows/user_followings'
end
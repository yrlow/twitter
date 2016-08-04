post '/users/:user_id/tweets' do 
	user = User.find(params[:user_id])
	tweet = user.tweets.new(params[:tweet])
	if tweet.save
		redirect "/users/#{current_user.id}/home"
	else
		@tweet_error = tweet.errors.full_messages
		@tweets = Tweet.all.order(updated_at: :desc)
		erb :'users/user_home'
	end
end

get '/users/:user_id/tweets/:id' do 
	@tweet = Tweet.find(params[:id])
	erb :'tweets/id'
end

get '/users/:user_id/tweets/:id/edit' do 
	@tweet = Tweet.find(params[:id])
	erb :'tweets/tweet_edit'
end

put '/users/:user_id/tweets/:id' do 
	tweet = Tweet.find(params[:id])
	if tweet.update(params[:tweet])
		redirect "/users/#{current_user.id}/tweets/#{tweet.id}"
	else
		@error = tweet.errors.full_messages
		erb :'tweets/tweet_edit'
	end

end

delete '/users/:user_id/tweets/:id' do 
	tweet = Tweet.find(params[:id])
	tweet.destroy
	redirect '/users/:id/home'
end
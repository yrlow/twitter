get '/users/:id/home' do
	
	@users = User.all
	@tweets = current_user.tweets.all.order(updated_at: :desc)
	erb :'users/user_home'
end

get '/users/new' do
	erb :"users/user_new"
end

post '/users/create' do 
	user = User.new(params[:user])
	if user.save
		session[:user_id] = user.id
		redirect "/users/#{current_user.id}/home"
	else
		@error = user.errors.full_messages
		erb :'users/user_new'
	end
end

get '/users/login' do
	if @user = User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
		
		session[:user_id] = @user.id
		redirect "/users/#{current_user.id}/home"
	else
		@error = "Invalid email or password!"
		erb :"static/index"
	end
end

post '/users/logout' do
	session[:user_id] = nil
	redirect '/'
end

get '/users/:id/edit' do
	erb :'users/user_edit'
end

put '/users/:id' do
	if current_user.update(params[:user])
		redirect "/users/#{current_user.id}/home"
	else
		@error = current_user.errors.full_messages
		erb :'users/user_edit'
	end
end

# get 'display followers and followings'

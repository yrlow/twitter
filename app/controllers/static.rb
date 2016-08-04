get '/' do
  erb :"static/index"
end

get '/home' do 
	if logged_in?
		redirect '/users/:id/home'
	else
		redirect '/'
	end
end
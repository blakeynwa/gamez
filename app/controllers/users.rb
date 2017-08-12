get '/users/new' do
  erb :'/users/create_user'
end

post '/users' do
  user_info = params[:user]
  user = User.new(username: user_info[:username], email: user_info["email"])
  user.password = user_info[:password]
  user.save
  session[:user_id] = user.id
  redirect 'users/stats'
end

post '/users' do
  redirect 'users/stats'
end

get '/users/login' do
  erb :'/users/login_page'
end

post '/login' do
  user = User.authenticate(params[:user][:username], params[:user][:password])
  session[:user_id] = user.id
  redirect 'users/stats'
end

get '/users/stats' do
  erb :'/users/user_stats'
end

post '/logout' do
  session.delete(:user_id)
  redirect '/'
end


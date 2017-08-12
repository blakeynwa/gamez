get '/users/new' do
  erb :'/users/create_user'
end

post '/users' do
  user_info = params[:user]
  user = User.new(username: user_info[:username], email: user_info["email"])

  if user_info[:password].length == 0
    user.valid?
    password_error = "Password can't be blank"
  else
    user.password = user_info[:password]
    user.save
  end

  if user.persisted?
    session[:user_id] = user.id
    redirect 'users/stats'
  else
    errors = user.errors.full_messages.concat([password_error])
    report_create_errors(errors)
  end
end

post '/users' do
  redirect 'users/stats'
end

get '/users/login' do
  erb :'/users/login_page'
end

post '/login' do
  user = User.authenticate(params[:user][:username], params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect 'users/stats'
  else
    report_login_errors
  end
end

get '/users/stats' do
  erb :'/users/user_stats'
end

post '/logout' do
  session.delete(:user_id)
  redirect '/'
end


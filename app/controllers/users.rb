# get '/users'  do
#   @users = User.all
#   erb :'/users/users'
# end

# get '/users/:id' do
#   @users = User.find(params[:id])
#   erb :'/users/one_user'
# end

get '/users/new' do
  erb :'/users/create_user'
end

post '/users' do
  redirect 'users/stats'
end

get '/users/login' do
  erb :'/users/login_page'
end

get '/users/stats' do
  erb :'/users/user_stats'
end

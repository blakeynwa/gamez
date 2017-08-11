get '/users'  do
  @users = User.all
  erb :users
end

get '/users/:id' do
  @users = User.find(params[:id])
  erb :one_user
end

get '/userz'  do
  @userz = User.all
  erb :userz
end

get '/userz/:id' do
  @userz = User.find(params[:id])
  erb :one_user
end

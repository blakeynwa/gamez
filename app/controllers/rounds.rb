get '/rounds'  do
  @rounds = Round.all
  erb :rounds
end

get '/rounds/:id' do
  @round = Round.find(params[:id])
  erb :one_round
end

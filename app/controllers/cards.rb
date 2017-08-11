get '/cards'  do
  @cards = Card.all
  erb :cards
end

get '/card/:id' do
  @card = Card.find(params[:id])
  erb :one_card
end

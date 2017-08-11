get '/decks'  do
  @decks = Deck.all
  erb :decks
end

get '/decks/:id' do
  @deck = Deck.find(params[:id])
  erb :one_deck
end

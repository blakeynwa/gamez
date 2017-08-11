get '/gamez' do
  @decks = Deck.all
  erb :'gamez/gamez_home'
end

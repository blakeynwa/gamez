get '/gamez' do
  @decks = Deck.all
  erb :'gamez/gamez_home'
end

get '/gamez/id' do
  erb :'/gamez/display_question'
end

post '/gamez/id' do
  #session[:round_id] = params[]
  #redirect '/gamez/id' unless !Deck.question.any? #logic to redirect only if questions remain
  redirect '/gamez/id/stats'
end

get '/gamez/id/stats' do
  erb :'/gamez/stats'
end

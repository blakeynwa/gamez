get '/gamez' do
  @decks = Deck.all
  erb :'gamez/gamez_home'
end

get '/gamez/:id' do
  @deck = Deck.find(params[:id])
  @round = Round.find(session[:round_id])
  @card = Card.find(params[:id])
  session[:card_id] = @card.id

  puts "=============="
  p @deck.id
  puts "=============="

  puts "=============="
  p @card 
  puts "=============="

  if @round.guesses.any? 
    if @round.guesses.last.correct? 
      @message = 'Correct!'
    else
      @message = 'Wrong!'
    end
  else
    @message = nil
  end

  erb :'/gamez/display_question'
end

post '/gamez/:id/next' do
  response = params[:answer]
  card = Card.find(session[:card_id])
  guess = Guess.create(guess: params[:answer], card_id: card.id, round_id: session[:round_id])
  guess.correct?
  p params
  redirect game_over?(guess[:round_id]) ? "/gamez/#{params[:id]}/stats" : "/gamez/#{params[:id]}"

end

get '/gamez/:id/stats' do
  erb :'/gamez/stats'
end

post '/gamez/:id' do
  if logged_in?
    session[:round_id] ||= Round.create(user_id: session[:user_id]).id
  else
    session[:round_id] ||= Round.create(user_id: 1).id
  end
  redirect "/gamez/#{params[:id]}"
end

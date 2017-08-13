get '/gamez' do
  # end round session if someone prematurely ends
  session.delete(:card_id) if session[:card_id]
  session.delete(:round_id) if session[:round_id]

  @decks = Deck.all
  erb :'gamez/gamez_home'
end

get '/gamez/:id' do
  @deck = Deck.find(params[:id])
  @round = Round.find(session[:round_id])
  @card = @round.next_card(@deck)
  session[:card_id] = @card.id

  if @round.guesses.any?
    @message = @round.guesses.last.correct? ? 'Correct!' : 'Wrong!'
  else
    @message = nil
  end

  erb :'/gamez/display_question'
end

post '/gamez/:id/next' do
  response = params[:answer]
  deck = Deck.find(params[:id])
  round = Round.find(session[:round_id])
  card = Card.find(session[:card_id])
  guess = Guess.create(guess: params[:answer], card_id: card.id, round_id: session[:round_id])
  guess.correct?
  guess.save

  session.delete(:card_id)

  redirect round.game_over?(deck) ? "/gamez/#{params[:id]}/stats" : "/gamez/#{params[:id]}"
end

get '/gamez/:id/stats' do
  @round = Round.last
  @deck = Deck.find(params[:id])
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

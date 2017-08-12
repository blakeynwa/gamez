get '/gamez' do
  @decks = Deck.all
  erb :'gamez/gamez_home'
end

get '/gamez/:id' do
  # if logged_in?
  #   session[:round_id] ||= Round.create(user_id: session[:user_id],deck_id: params[:id]).id
  # else
  #   session[:round_id] ||= Round.create(user_id: 1,deck_id: params[:id]).id
  # end
  @title = Deck.find(params[:id]).title
  @round = Round.find(session[:round_id])
  @card = @round.next_card

  erb :'/gamez/display_question'
end

# post '/gamez/:id' do

#   #redirect '/gamez/id' unless !Deck.question.any? #logic to redirect only if questions remain
#   redirect '/gamez/id/stats'
# end

get '/gamez/id/stats' do
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

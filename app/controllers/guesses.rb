get '/guesses'  do
  @guesses = Guess.all
  erb :guesses
end

get '/guesses/:id' do
  @guess = Guess.find(params[:id])
  erb :one_guess
end

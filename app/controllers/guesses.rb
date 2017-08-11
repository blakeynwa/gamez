get '/guesses'  do
  @guessess = Guess.all
  erb :guesses
end

get '/guesses/:id' do
  @guess = Guess.find(params[:id])
  erb :one_guess
end

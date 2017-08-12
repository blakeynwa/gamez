helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end

  def guessed_cards(round_id)
  	round = Round.find(round_id)
  	round.guesses.uniq { |guess| guess.card }.map { |guess| guess.card }
  end

  def unguessed_cards(round_id)
		round = Round.find(round_id)
  	round.cards - guessed_cards(round_id)
	end

	def guessed_right(round_id)
		round = Round.find(round_id)
		good_guesses = round.guesses.where(correctness: true)
		good_guesses.map { |guess| guess.card }
	end

	def guessed_wrong(round_id)	
		round = Round.find(round_id)	
		round.cards - guessed_right(round_id)
	end

	def next_card(round_id)
		unguessed = unguessed_cards(round_id)
		if unguessed.empty?
			guessed_cards(round_id).sample
		else
			unguessed.sample
		end
	end

	def game_over?(round_id)
		unguessed_cards(round_id) && guessed_cards(round_id)
	end
end

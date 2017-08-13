class Deck < ActiveRecord::Base
  has_many :cards

  def play_count
    @play_count = self.cards.first.guesses.uniq { |guess| guess.round }.count
  end

  def card_count
    self.cards.count
  end

  def rounds
    self.cards.first.guesses.uniq { |guess| guess.round }.map { |guess| guess.round }
  end

  def avg_guesses
    self.rounds.reduce(0) { |sum, round| sum + round.guesses.count } / play_count
  end

  def avg_wrong
    self.avg_guesses - self.card_count
  end

  def avg_first_try
    score = self.card_count - self.avg_wrong
    score < 0 ? 0 : score
  end
end

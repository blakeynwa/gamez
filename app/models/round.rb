  class Round < ActiveRecord::Base
  belongs_to :user
  has_many :guesses
  has_many :cards, through: :guesses

  def all_cards(deck)
    deck.cards
  end

  def game_over?(deck)
    self.all_cards(deck).count == self.guessed_right.count
  end

  def guessed_right
    self.guesses.where(correctness: true).map { |guess| guess.card }
  end

  def guessed_wrong
    self.guesses.uniq { |guess| guess.card }.map { |guess| guess.card } - self.guessed_right
  end

  def guessed_cards
    self.guesses.uniq { |guess| guess.card }.map { |guess| guess.card }
  end

  def unguessed_cards(deck)
    self.all_cards(deck) - self.guessed_cards
  end

  def next_card(deck)
    unguessed = self.unguessed_cards(deck)
    if unguessed.any?
      unguessed.sample
    else
      self.guessed_wrong.sample
    end
  end

  # STAT METHODS
  # counts correct guesses at given moment
  def total_correct
    self.guesses.count(&:correct?)
  end

  # counts incorrect guesses at given moment
  def total_incorrect
    self.guesses.count(&:incorrect?)
  end

  def incorrect_guesses
    self.guesses.where(correctness: false).uniq { |guess| guess.card }
  end

  def first_try
    score = self.total_cards - self.total_incorrect
    score < 0 ? 0 : score
  end

  def total_cards
    @total_cards ||= self.cards.uniq.count
  end

  def total_guesses
    @total_guesses ||= self.guesses.count
  end
end

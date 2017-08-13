  class Round < ActiveRecord::Base
  belongs_to :user
  has_many :guesses
  has_many :cards, through: :guesses
  has_one :deck, through: :cards

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
    if unguessed
      unguessed.sample
    else
      self.guessed_wrong.sample
    end
  end

  # STAT METHODS
  # counts correct guesses at given moment
  def correct_guesses
    self.guesses.count(&:correct?)
  end

  # counts incorrect guesses at given moment
  def incorrect_guesses
    self.cards.count(&:incorrect?)
  end

  def total_cards
    @total_cards ||= self.cards.count
  end

  def total_guesses
    @total_guesses ||= self.guesses.count
  end

  def first_try
    @first_try ||= self.cards.where('count(guesses) = 1').count
  end

  def stats
    {total_cards: total_cards, total_guesses: total_guesses, first_try: first_try, datetime: created_at}
  end
end

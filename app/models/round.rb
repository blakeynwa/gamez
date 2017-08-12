  class Round < ActiveRecord::Base
  belongs_to :user
  has_many :guesses
  has_many :cards, through: :guesses
  has_one :deck, through: :cards

  def next_card
    game_deck.pop # returns next q or nil if no more questions
  end

  # def game_deck
  #   @game_deck = @cards.
  # end

  # def guessed_cards
  #   cards.where
  # end


  # STAT METHODS
  # counts correct guesses at given moment
  def correct_guesses
    self.cards.count(&:correct?)
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

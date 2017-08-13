class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses

  def correct?(guess)
    guess.downcase.strip == answer.downcase.strip
  end

  def incorrect?(guess)
    !self.correct?(guess)
  end
end

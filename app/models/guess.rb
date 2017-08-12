class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :round

  validates :guess, length: { minimum: 1 }

  def correct?
    correctness ||= card.correct?(self.guess)
  end

  def incorrect?
    !correct?
  end

end

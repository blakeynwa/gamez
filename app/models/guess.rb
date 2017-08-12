class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :round

  def correct?
    self.correctness ||= card.correct?(self.guess)
  end

  def incorrect?
    !correct?
  end

end

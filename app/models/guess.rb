class Guess < ActiveRecord::Base
  belongs_to :card

  def self.all
    [Guess.new]
  end
end

class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses

  def self.all
    [Card.new]
  end
end

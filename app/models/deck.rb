class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :cards

  def self.all
    [Deck.new]
  end
end

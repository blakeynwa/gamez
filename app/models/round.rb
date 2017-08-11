class Round < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user

  def self.all
    [Round.new]
  end
end
